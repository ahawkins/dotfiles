require 'fileutils'

namespace :music do
  desc "Remove newly downloaded items that already in the library"
  task :clean do
    releases = []

    Dir['/Volumes/Vault/music/{albums,eps,compilations,series_compilations}/*'].each do |sub|
      Dir["#{sub}/*"].each do |release|
        releases << File.basename(release)
      end
    end

    Dir["/Volumes/Vault/music/tracks/*"].each do |release|
      releases << File.basename(release)
    end

    duplicates = []

    Dir["/Volumes/Vault/unorganized/{albums,compilations,eps,tracks}/*"].each do |download|
      release = File.basename download

      duplicates << download if releases.include? release
    end

    duplicates.each do |path|
      puts "Duplicate: #{path}"

      FileUtils.rm_rf path
    end
  end
end
