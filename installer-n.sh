#!/bin/bash

cd

echo ---------------------------------------------------------------------
echo             Benvenuti all\'installer di Nicola
echo ---------------------------------------------------------------------


echo Aggiunta dei repository necessari...

sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_15.10/ /' >> /etc/apt/sources.list.d/arc-theme.list"
sudo apt-add-repository -y ppa:numix/ppa
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo add-apt-repository -y ppa:danielrichter2007/grub-customizer
sudo sh -c "echo 'deb http://archive.canonical.com/ubuntu/ trusty partner' >> /etc/apt/sources.list.d/canonical_partner.list"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo add-apt-repository "deb http://nl.archive.ubuntu.com/ubuntu/ vivid main universe"


echo Aggiornamento della cache...

sudo apt-get update


echo Scaricamento dei pacchetti necessari...

sudo apt-get -y --force-yes install git
#git clone https://bitbucket.org/gemlion/aurora-penguinis.git
sudo apt-get -y --force-yes install arc-theme
sudo apt-get -y --force-yes install numix-icon-theme-circle


echo Download e impostazione dello sfondo del desktop...

sudo mkdir /opt/images
sudo wget -q --output-document /opt/images/background.jpg http://images5.fanpop.com/image/photos/27900000/Gothic-World-gothic-27973839-1920-1080.jpg
gsettings set org.gnome.desktop.background picture-uri file:///opt/images/background.jpg

echo Impostazione del tema e del tema delle icone...

gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Dark'
gsettings set org.gnome.desktop.wm.preferences theme 'Arc-Dark'
gsettings set org.gnome.desktop.interface icon-theme 'Numix-Circle'
#sudo mkdir /boot/grub/themes/Aurora-Penguinis-GRUB2
#sudo cp -R aurora-penguinis/Aurora-Penguinis-GRUB2 /boot/grub/themes/
#sudo su
#echo "GRUB_THEME=\"/boot/grub/themes/Aurora-Penguinis-GRUB2/theme.txt\"" >> /etc/default/grub
#exit
#sudo grub-mkconfig -o /boot/grub/grub.cfg

#sudo mkdir /lib/plymouth/themes/Aurora-Penguinis-Plymouth-2
#sudo cp -R aurora-penguinis/Aurora-Penguinis-Plymouth-2 /lib/plymouth/themes/
#sudo update-alternatives --install /lib/plymouth/themes/default.plymouth default.plymouth /lib/plymouth/themes/Aurora-Penguinis-Plymouth-2/aurora-penguinis-2.plymouth 100



#echo Impostazione del tema di accensione...
#echo Dovrai scegliere il tema da impostare...

#sudo update-alternatives --config default.plymouth
#sudo update-initramfs -u

gconftool-2 --set --type int /apps/compiz-1/plugins/unityshell/screen0/options/launcher_hide_mode 1

echo Scaricamento dei programmi aggiuntivi...

sudo apt-get -y --force-yes install geany
sudo apt-get -y --force-yes install google-chrome-stable
sudo apt-get -y --force-yes install compiz-*
sudo apt-get -y --force-yes install unity-tweak-tool
sudo apt-get -y --force-yes install unetbootin
sudo apt-get -y --force-yes install gparted
sudo apt-get -y --force-yes install gdebi
sudo apt-get -y --force-yes install virtualbox
sudo apt-get -y --force-yes install reaver
sudo apt-get -y --force-yes install eclipse
sudo apt-get -y --force-yes install grub-customizer
sudo apt-get -y --force-yes install skype
sudo apt-get -y --force-yes install pbuilder
sudo apt-get -y --force-yes install spotify-client
sudo apt-get -y --force-yes install libgtk-3-dev
sudo apt-get -y --force-yes install kazam
sudo apt-get -y --force-yes install gimp
sudo apt-get -y --force-yes install devscripts
sudo apt-get -y --force-yes install debhelper
sudo apt-get -y --force-yes install dpatch
sudo apt-get -y --force-yes install cdbs
sudo apt-get -y --force-yes install aircrack-ng
sudo apt-get -y --force-yes install xdotool
sudo apt-get -y --force-yes install wine
sudo apt-get -y --force-yes install pamusb-tools

#installa dropbox
cd && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd

wget http://cz.archive.ubuntu.com/ubuntu/pool/main/libg/libgcrypt11/libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb
sudo dpkg -i libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb
sudo rm libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb




sudo apt-get -y --force-yes -f install
sudo apt-get -y --force-yes install lib32z1
sudo apt-get -y --force-yes install libfontconfig1



echo Impostazione del browser predefinito...
echo Dovreai scegliere il browser desiderato...

sudo update-alternatives --config x-www-browser

echo Configurazione spazi di lavoro e launcher

dconf write /org/compiz/profiles/unity/plugins/core/hsize 4
dconf write /org/compiz/profiles/unity/plugins/core/vsize 2

echo Aggiunta dei collegamenti del launcher...
gsettings set com.canonical.Unity.Launcher favorites "['application://org.gnome.Nautilus.desktop', 'application://google-chrome.desktop', 'application://libreoffice-writer.desktop', 'application://geany.desktop', 'application://gnome-terminal.desktop', 'application://gedit.desktop', 'unity://devices', 'unity://running-apps']"


echo Configurazione \"Dottore\"...

sudo wget https://raw.githubusercontent.com/bssec/Dottore/master/dottore.sh /usr/bin/dottore
sudo chmod +x /usr/bin/dottore
sudo ln /usr/bin/dottore /usr/bin/dottor


echo [Desktop Entry] >> .config/autostart/dottore.desktop
echo Type=Application >> .config/autostart/dottore.desktop
echo Exec=dottore >> .config/autostart/dottore.desktop
echo Name=dottore >> .config/autostart/dottore.desktop
echo Comment=dottore  >> .config/autostart/dottore.desktop
chmod +x .config/autostart/dottore.desktop

#TODO
#attivare natural scrolling
#aggiungere parametro kernel acpi_osi=
#nascondere layout tastierae


#modalità interattiva


echo Configurazione megasync...
wget https://raw.githubusercontent.com/bssec/MEGA-Instances/master/mega_instances.sh && bash mega_instances.sh


echo Riavvia il sistema per completare gli aggiornamenti...
