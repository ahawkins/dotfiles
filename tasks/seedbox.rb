require 'fileutils'

namespace :seedbox do
  desc "Remove already downloaded torrents"
  task :clean do
    downloads = File.new("#{ENV['HOME']}/.seedbox_downloads").lines.map(&:chop)

    releases = Dir["#{ENV['HOME']}/seedbox/downloads/{albums,tracks,compilations,radios}/*"]

    downloaded = releases.select do |release|
      name = File.basename release
      downloads.include? name
    end

    puts "Removing: #{downloaded.size}"

    downloaded.each do |path|
      puts "Deleting: #{File.basename(path)}"
      FileUtils.rm_rf path
    end
  end
end
