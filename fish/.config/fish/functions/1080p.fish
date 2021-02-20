function 1080p
	echo "Resizing $argv[1] 1080p"

	# 1080p is 1920x1080
	# Bounds is startX, startY, endX, endY. Adjust size from starting position to account for this
	osascript -e "tell application \"$argv[1]\" to set the bounds of the first window to {250, 220, 2170, 1300}"

	# activate the app, to bring it to the front
	osascript -e "tell application \"$argv[1]\" to activate" 
end
