#!/usr/bin/env ruby

require 'net/http'
require 'json'
require 'tmpdir'
require 'pathname'
require 'forwardable'

class RateCache
	def initialize(store = Pathname.new(Dir.tmpdir))
		@store = store
	end

	# Expires: 5 hours
	def fetch(currency, expires: 60 * 60 * 5)
		cache = store.join(currency)

		if cache.exist? && cache.mtime >= Time.now - expires
			cache.read.to_f
		else
			response = Net::HTTP.get('coincap.io', "/page/#{currency}")
			data = JSON.load(response)
			data.fetch('price_usd').to_f.tap do |rate|
				cache.open('w') do |file|
					file.write rate
				end
			end
		end
	end

	private

	def store
		@store
	end
end

class Portfolio
	extend Forwardable
	include Enumerable

	def_delegators :currencies, :each

	def initialize(data = $stdin, cache = RateCache.new)
		@data = data.read
		@cache = cache
	end

	def holdings
		@data.scan(/(\w+)\s+([\.\d]+)/).each_with_object({ }) do |pair, bucket|
			currency, amount = *pair
			bucket[currency] = amount.to_f
		end
	end

	def currencies
		holdings.keys
	end

	def usd_value
		holdings.sum do |currency, amount|
			rates.fetch(currency) * amount
		end
	end

	def btc_value
		usd_value / rates['BTC']
	end

	def [](currency)
		holdings.fetch(currency)
	end

	def usd(currency)
		self[currency] * rates.fetch(currency)
	end

	def allocation(currency)
		((self[currency] * rates.fetch(currency) / usd_value) * 100)
	end

	private
	def rates
		currencies.each_with_object({ }) do |currency, bucket|
			bucket[currency] = @cache.fetch(currency)
		end
	end
end

case ARGV[0]
when 'portfolio'
	portfolio = Portfolio.new

	puts("%3s %12s %14s %6s" % [
		nil,
		'Sum',
		'USD',
		'%'
	])

	portfolio.each do |currency|
		puts("%3s %12.4f %14.2f %6.2f\%" % [
			currency,
			portfolio[currency],
			portfolio.usd(currency),
			portfolio.allocation(currency)
		])
	end

	puts('-' * 39)

	puts("%3s %12s %14.2f" % [
		'USD',
		nil,
		portfolio.usd_value
	])
when 'distribute'
	ARGV.shift

	portfolio = Portfolio.new

	allocations = ARGV.each_with_object({ }) do |pair, bucket|
		part1, part2 = pair.split(':')

		if part1 =~ /^[A-Z]+$/
			bucket[part1] = part2.to_f
		else
			bucket[part2] = part1.to_f
		end
	end

	total_allocation = allocations.sum do |_currency, allocation|
		allocation
	end

	if total_allocation.to_i != 100
		$stderr.puts("#{total_allocation.to_i}% allocation's doesn't look right!")
		exit 1
	end

	puts("%4s %6s %10s %14s" % [
		nil,
		'%',
		'USD',
		'BTC'
	])

	allocations.each_pair do |currency, allocation|
		puts("%4s %6.1f %10.2f %14.8f" % [
			currency,
			allocation,
			portfolio.usd_value * (allocation / 100.0),
			portfolio.btc_value * (allocation / 100.0)
		])
	end

	puts('-' * 40)

	puts("%4s %6d %10.2f %14.8f" % [
		nil,
		total_allocation,
		portfolio.usd_value,
		portfolio.btc_value
	])
else
	$stderr.puts("Unknown command!")
	exit 1
end
