require 'fileutils'

FLAC_CMD = '/usr/local/bin/flac'
LAME_CMD = '/usr/local/bin/lame'

NUMBER_OF_WORKERS = 4

desc "Convert all FLAC's to mp3s and delete source" 
task :convert  do
  base_path = File.expand_path('..', __FILE__)

  convert_cmds = Dir["#{base_path}/**/*.flac"].inject([]) do |cmds, flac|
    output_directory = File.dirname flac

    file_name = File.basename(flac, '.flac')

    mp3_file = File.join(output_directory, "#{file_name}.mp3")

    tag_args = ""

    # grab meta data
    tags = `metaflac --export-tags-to=- "#{flac}"`.split("\n").inject({}) do |hash, line|
      begin
        parts = line.split('=')
        hash.merge parts[0].downcase.to_sym => parts[1] if parts[0] != ""
      rescue
        # pip pip, carry on. Metadata is secondary
      end
    end

    tag_args << %Q{--tt "#{tags[:title]}" --ta "#{tags[:artist]}" --tl "#{tags[:album]}" --tn "#{tags[:tracknumber]}"} if tags

    # see if there is an image file in the directory to use for the album art

    this_directory = File.dirname flac

    album_art = Dir["#{this_directory}/cover.jpg}"].first
    album_art ||= Dir["#{this_directory}/folder.jpg}"].first
    # select the longest file, Example, there is like back.jpg and $name_of_releaese.jpg
    # we should use name_of_release.jpg
    album_art ||= Dir["#{this_directory}/*.jpg"].sort {|f1, f2| f2.length <=> f1.length }.first

    if album_art != nil
      file_size = %x{du -h "#{album_art}"}
      file_size = file_size.match(/(\d+)[K|M]/)[1]
      #tag_args << %Q{ --ti "#{album_art}"}
    end

    decode_cmd = %Q{#{FLAC_CMD} -sdc "#{flac}"}
    encode_cmd = %Q{#{LAME_CMD} -h -b 320 --cbr #{tag_args} - "#{mp3_file}"}
    clean_up_cmd = %Q{rm "#{flac}"}

    convert_cmd = "#{decode_cmd} | #{encode_cmd} && #{clean_up_cmd}"
    cmds << convert_cmd
    cmds
  end

  groups = conver_cmd.size / NUMBER_OF_WORKERS

  queues = convert_cmds.each_slice(groups).to_a

  queues.each do |queue|
    fork do
      queue.each do |cmd|
        system cmd
      end
    end
  end

  Process.waitall
end
