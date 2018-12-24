# arch

## if no polish signs in terminal
    * echo "LANG=en_US.UTF-8" > /etc/locale.conf
    * unset LANG
    * source /etc/profile.d/locale.sh
## swap ctrl with caps, set pl for X
    * setxkbmap -layout pl -option ctrl:nocaps 
## lock screen after login with i3lock, udev rule
    * cp ~/.files/conf/resume@.service /etc/systemd/system 




















    
    
