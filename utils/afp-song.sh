echo Song = $1 - e.g. Djole
core=../src/core

echo Starting $1
cat $core/afroplayer.rb | sonic_pi
cat $core/afp-song.rb | sonic_pi
cat $core/../rhythms/$1.rb | sonic_pi
cat $core/afp-song-run.rb | sonic_pi

echo press enter to stop
read key

sonic_pi stop

