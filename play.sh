#! /bin/sh

trap 'echo Press Ctrl + \\ to quit' 2
trap 'exit 0' 3

random() {
    echo `awk "BEGIN {
	srand()
	do {
		r1=rand();
		r2=rand();
	} while (r2 > r1);
	print 1 + int(r1 * $1)
    }"`
}

play() {
    size=`ls -tr | wc -l`
    line=`random $size`
    file=`ls -tr | sed -n "$line"p`
    mplayer "$file" && touch "$file"
}

while true
do
    play
done


