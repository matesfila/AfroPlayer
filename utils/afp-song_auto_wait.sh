echo Song = $1 - e.g. Djole
core=../src/core

echo Waiting for file $1.rb modification
echo Press ctrl-C to stop
while [ true ]
do
	echo Console: $j
	echo Stopping...
	sonic_pi stop
	echo Stopped
	sleep 1
	echo Starting $1
	cat $core/afroplayer.rb | sonic_pi
	cat $core/afp-song.rb | sonic_pi
	cat $core/../rhythms/$1.rb | sonic_pi
	cat $core/afp-song-run.rb | sonic_pi
	echo Started. Waiting for modification
	read x
done #< <(inotifywait -m -e modify $core/../rhythms/$1.rb)
