# netconsole
Use RaspberryPi as remote console

https://realpython.com/python-raspberry-pi/
#=== install updates vim & byobu
#enable ssh via raspi-config
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get dist-upgrade
sudo apt-get install -y vim byobu ftp

#=== hostname & hosts
sudo raspi-config
    1 change 'pi' password
    2 set hostname to'netcon
    4 change locale - set to 'en_US.UTF-8 UTF-8'
    4 time zone - America, New York
    5 SSH - enable
    5 SPI - enable
    5 I2C - enable
    5 GPIO enable

#===
#=== Create new user account
sudo adduser networks
sudo usermod -aG sudo,dialout networks

##== Logout and back in as Networks ==##
##== Logout and back in as Networks ==##
##== Logout and back in as Networks ==##

#=== File Preperation
Copy the below files into networks user home directory
FreeMono.ttf
issue
issue.net
launchconsole.sh
minidisplay.py
chmod +x launchconsole.sh minidisplay.py
cat launchconsole.sh >> .profile
sudo cp issue /etc
sudo cp issue.net /etc

#=== update ssh login banner
sudo vim /etc/ssh/sshd_config
#Update banner line to the below
Banner /etc/issue.net
sudo service ssh restart
/etc/dhcpcd.conf
--- add bit about static secondary IP for FTI here ---

#=== Final ====
