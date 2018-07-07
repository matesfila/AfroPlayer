echo %1
echo %2

rem sonic_pi clear
type %1\%2 | sonic_pi
type %1\..\core\afroplayer.rb | sonic_pi
type %1\..\core\afp-jam.rb | sonic_pi

pause

sonic_pi stop