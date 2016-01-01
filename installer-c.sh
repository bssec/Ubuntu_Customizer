#!/bin/bash

cd

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
sudo add-apt-repository -y "deb http://nl.archive.ubuntu.com/ubuntu/ vivid main universe"
sudo add-apt-repository -y ppa:mixxx/mixxx


echo Aggiornamento della cache...

sudo apt-get update


echo Scaricamento dei pacchetti necessari...

sudo apt-get -y --force-yes install git
git clone https://bitbucket.org/gemlion/aurora-penguinis.git
sudo apt-get -y --force-yes install arc-theme
sudo apt-get -y --force-yes install numix-icon-theme-circle


echo Download e impostazione dello sfondo del desktop...

sudo mkdir /opt/images
sudo wget -q --output-document /opt/images/backgroung.jpg http://media.lifehack.org/wp-content/files/2013/04/29.jpg
gsettings set org.gnome.desktop.background picture-uri file:///opt/images/backgroung.jpg

echo Impostazione del tema e del tema delle icone...

gsettings set org.gnome.desktop.interface gtk-theme 'Arc'
gsettings set org.gnome.desktop.wm.preferences theme 'Arc'
gsettings set org.gnome.desktop.interface icon-theme 'Numix-Circle'
sudo mkdir /boot/grub/themes/Aurora-Penguinis-GRUB2
sudo cp -R aurora-penguinis/Aurora-Penguinis-GRUB2 /boot/grub/themes/
sudo sh -c 'echo "GRUB_THEME=\"/boot/grub/themes/Aurora-Penguinis-GRUB2/theme.txt\"" >> /etc/default/grub'
sudo grub-mkconfig -o /boot/grub/grub.cfg

sudo mkdir /lib/plymouth/themes/Aurora-Penguinis-Plymouth-2
sudo cp -R aurora-penguinis/Aurora-Penguinis-Plymouth-2 /lib/plymouth/themes/
sudo update-alternatives --install /lib/plymouth/themes/default.plymouth default.plymouth /lib/plymouth/themes/Aurora-Penguinis-Plymouth-2/aurora-penguinis-2.plymouth 100

sudo wget -O /opt/images/shutdown.png http://bssec.altervista.org/images/hibernate.png


echo Impostazione del tema di accensione...
echo Dovrai scegliere il tema da impostare...

sudo update-alternatives --config default.plymouth
sudo update-initramfs -u


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
sudo apt-get -y --force-yes install evolution
sudo apt-get -y --force-yes install mixxx
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
~/.dropbox-dist/dropboxd
wget http://cz.archive.ubuntu.com/ubuntu/pool/main/libg/libgcrypt11/libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb
sudo dpkg -i libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb
sudo rm libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb
wget https://mega.nz/linux/MEGAsync/xUbuntu_15.10/amd64/megasync-xUbuntu_15.10_amd64.deb
sudo dpkg -i megasync-xUbuntu_15.10_amd64.deb
sudo rm megasync-xUbuntu_15.10_amd64.deb
sudo apt-get -y --force-yes -f install
sudo apt-get -y --force-yes install lib32z1
sudo apt-get -y --force-yes install libfontconfig1
wget --https-only https://raw.githubusercontent.com/bssec/AnonSurf-Installer/master/as-installer.sh && chmod +x as-installer.sh && sudo bash as-installer.sh
sudo sh -c "echo \"$USER $(hostname) = (root) NOPASSWD: /usr/bin/anonsurf\" >> /etc/sudoers"


echo Configurazione di telegram

wget https://tdesktop.com/linux -O telegram.tar.xz
sudo wget http://bssec.altervista.org/images/telegram.png -O /opt/images/telegram.png
tar xf telegram.tar.xz
sudo cp -r Telegram /opt

echo [Desktop Entry] >> telegram.desktop
echo Version=1.6 >> telegram.desktop
echo Name=Telegram >> telegram.desktop
echo Exec='/home/carlo/Telegram/Telegram' >> telegram.desktop
echo Icon=/opt/images/telegram.png >> telegram.desktop
echo Type=Application >> telegram.desktop
echo Terminal=False >> telegram.desktop

sudo mv telegram.desktop /usr/share/applications/
sudo chmod +x /usr/share/applications/telegram.desktop
cd
mkdir $HOME/.config/autostart
sudo cp /usr/share/applications/telegram.desktop .config/autostart/



echo Configurazione megasync...


mkdir $HOME/.config/autostart
mkdir $HOME/Scrivania/Mega
mkdir $HOME/Scrivania/Mega_bssec



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
echo notify-send \"Buongiorno Dottore\" \"Bentornato e buon lavoro...\" >> dottore
sudo mv dottore /usr/bin/dottore
sudo chmod +x /usr/bin/dottore


echo [Desktop Entry] >> .config/autostart/dottore.desktop
echo Type=Application >> .config/autostart/dottore.desktop
echo Exec=dottore >> .config/autostart/dottore.desktop
echo Name=dottore >> .config/autostart/dottore.desktop
echo Comment=dottore  >> .config/autostart/dottore.desktop
chmod +x .config/autostart/dottore.desktop


echo Riavvia il sistema per completare gli aggiornamenti...
