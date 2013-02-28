namespace :music do
  desc "Delete any files that exist as mixed tracks"
  task :wipe_single_tracks do
    releases = Dir["/Volumes/Vault/mp3s/*"]

    releases.each do |release|
      next if release !~ /(mixed|compiled)_by/i

      Dir["#{release}/**/*.{flac,mp3}"].each do |mp3|
        track_name = File.basename mp3

        if track_name !~ /(mixed_by|compiled_by|continuous_mix)/i
          `rm -rf "#{mp3}"`
        end
      end
    end
  end

  namespace :sync do
    patterns = %w(*.cue *.m3u *.nfo *.sfv *DS_Store *.log ._* Rakefile)
    excludes = patterns.map { |r| "--exclude \"#{r}\"" }.join(' ')

    desc "Sync MP3s to local HD"
    task :computer do
       system "rsync -avh #{excludes} /Volumes/Vault/mp3s ~/"
    end

    desc "Sync MP3s from computer to modile"
    task :mobile do
      # if File.directory? "/Volumes/NO NAME"
        sdcard = "/Volumes/NO NAME"
      # end

      directory = "#{sdcard}/music"

      system "rsync -avh --delete #{excludes} --modify-window=1000 ~/mp3s/ \"#{directory}/\""
    end
  end
end
