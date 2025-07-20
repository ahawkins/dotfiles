function ytrip --wraps yt-dlp --description "Rips YouTube video to mp3s using yt-dlp"
	pushd ~/Downloads

	yt-dlp \
		--embed-thumbnail \
		--extract-audio \
		--audio-format mp3 \
		--audio-quality best \
		$argv ; popd
end
