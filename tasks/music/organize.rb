require 'fileutils'

namespace :music do
  namespace :organize do
    desc "Organize radio shows"
    task :radios do
      known_radio_shows = Dir["/Volumes/Vault/music/radios/*"].map {|d| File.basename d }

      unorganized_releases = Dir["/Volumes/Vault/unorganized/radios/*"]

      unorganized_releases.each do |directory_path|
        release_name = File.basename directory_path

        if release_name =~ /(\d{4})-\d{2}-\d{2}/
          year = $1
        elsif release_name =~ /\d{2}-\d{2}-(\d{4})/
          year = $1
        else
          puts "#{release_name} did not contain an air date. Skipping..."
          next
        end

        matched_radios = known_radio_shows.select do |radio_show|
          regex = Regexp.new(Regexp.escape(radio_show), true)
          release_name.match(regex)
        end.sort { |r1, r2| r2.length <=> r1.length }

        if matched_radios.size != 0
          radio_show = matched_radios.first
        else
          puts "Enter a show for #{release_name} (or s to ignore)"
          putc ">"

          radio_show = $stdin.gets.chomp
        end

        next if radio_show == 'skip' || radio_show == 's'

        radio_show.gsub! /\s+/, '_'

        base_directory = "/Volumes/Vault/music/radios/#{radio_show}/#{year}"

        FileUtils.mkdir_p base_directory

        new_path = "#{base_directory}/#{release_name}"

        move_command = %Q{mv "#{directory_path}" "#{new_path}"}

        %x{#{move_command}}

        puts "Finished with: #{release_name}"
      end
    end
  end
end
