#!/usr/bin/env dash
NAME="$1"

podman rm "$NAME"
returnVal="$?"

case $returnVal in
	0)
		echo "Container removed"
		;;
	1)
		echo "Container did not exist"
		;;
	2)
		echo "Container running, exiting gracefully"
		exec podman exec "$NAME" rcon-cli stop
		;;
	125)
		echo "Unexpected error"
		exit 1
		;;
esac
