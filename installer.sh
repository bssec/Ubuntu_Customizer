#!/bin/bash

echo ---------------------------------------------------------------------
echo             Benvenuti all installer di Carlo Ramponi
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


echo Aggiornamento della cache...

sudo apt-get update


echo Scaricamento dei pacchetti necessari...

sudo apt-get -y --force-yes -qq install plymouth-theme-fade-in
sudo apt-get -y --force-yes -qq install plymouth-theme-glow
sudo apt-get -y --force-yes -qq install plymouth-theme-sabily
sudo apt-get -y --force-yes -qq install plymouth-theme-solar
sudo apt-get -y --force-yes -qq install arc-theme
sudo apt-get -y --force-yes -qq install numix-icon-theme-circle

echo Download e impostazione dello sfondo del desktop...

sudo wget -q --output-document /opt/backgroung.jpg http://media.lifehack.org/wp-content/files/2013/04/29.jpg
gsettings set org.gnome.desktop.background picture-uri file:///opt/backgroung.jpg

echo Impostazione del tema e del tema delle icone...

gsettings set org.gnome.desktop.interface gtk-theme 'Arc'
gsettings set org.gnome.desktop.wm.preferences theme 'Arc'
gsettings set org.gnome.desktop.interface icon-theme 'Numix-Circle'

echo Impostazione del tema di accensione...
echo Dovrai scegliere il tema da impostare...

sudo update-alternatives --config default.plymouth
sudo update-initramfs -u

echo Scaricamento dei programmi aggiuntivi...

sudo apt-get -y --force-yes install geany
sudo apt-get -y --force-yes install google-chrome-stable
sudo apt-get -y --force-yes install compiz-config
sudo apt-get -y --force-yes install unity-tweak-tool
sudo apt-get -y --force-yes install unetbootin
sudo apt-get -y --force-yes install gparted
sudo apt-get -y --force-yes install gdebi
sudo apt-get -y --force-yes install eclipse
sudo apt-get -y --force-yes install grub-customizer
sudo apt-get -y --force-yes install skype
sudo apt-get -y --force-yes install spotify-client
sudo apt-get -y --force-yes install libgtk-3-dev
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd
wget https://mega.nz/linux/MEGAsync/xUbuntu_15.10/amd64/megasync-xUbuntu_15.10_amd64.deb
sudo dpkg -i megasync-xUbuntu_15.10_amd64.deb
sudo rm megasync-xUbuntu_15.10_amd64.deb
sudo apt-get -f install
sudo apt-get install lib32z1
sudo apt-get install libfontconfig1

echo Configurazione megasync...


mkdir $HOME/.config/autostart
mkdir $HOME/Scrivania/Mega
mkdir $HOME/Scrivania/Mega_bssec

cd
echo "HOME=/home/carlo/Scrivania/Mega" >> mega.sh
echo "megasync &" >> mega.sh
echo "HOME=/home/carlo/Scrivania/Mega_bssec" >> mega.sh
echo "megasync &" >> mega.sh
chmod +x mega.sh

echo "[Desktop Entry]" >> .config/autostart/megasync_instances.desktop
echo "Type=Application" >> .config/autostart/megasync_instances.desktop
echo "Exec=.$HOME/mega.sh" >> .config/autostart/megasync_instances.desktop
echo "Name=megasync_instances" >> .config/autostart/megasync_instances.desktop
echo "Comment=megasync_instances"  >> .config/autostart/megasync_instances.desktop
chmod +x .config/autostart/megasync_instances.desktop


echo Impostazione del browser predefinito...
echo Dovreai scegliere il browser desiderato...

sudo update-alternatives --config x-www-browser

echo Configurazione spazi di lavoro e launcher

dconf write /org/compiz/profiles/unity/plugins/core/hsize 3
dconf write /org/compiz/profiles/unity/plugins/core/vsize 3

echo Aggiunta dei collegamenti del launcher...
gsettings set com.canonical.Unity.Launcher favorites "['application://org.gnome.Nautilus.desktop', 'application://google-chrome.desktop', 'application://libreoffice-writer.desktop', 'application://geany.desktop', 'application://gnome-terminal.desktop', 'application://gedit.desktop', 'unity://devices', 'unity://running-apps']"


echo Configurazione \"Dottore\"...


cd
echo -e notify-send \"Buongiorno Dottore\" \"Bentornato e buon lavoro...\" >> dottore
sudo mv dottore /usr/bin/dottore
sudo chmod +x /usr/bin/dottore


echo [Desktop Entry] >> .config/autostart/dottore.desktop
echo Type=Application >> .config/autostart/dottore.desktop
echo Exec=dottore >> .config/autostart/dottore.desktop
echo Name=dottore >> .config/autostart/dottore.desktop
echo Comment=dottore  >> .config/autostart/dottore.desktop
chmod +x .config/autostart/dottore.desktop


echo Riavvia il sistema per completare gli aggiornamenti...