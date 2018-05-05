#######################################################
#############以下全是错的无效的##################
(echo "[Desktop Entry]
Name=unzip
Name[zh_CN]=unzip
Name[zh_TW]=unzip
Exec=unzip -O gbk
Icon=
Terminal=false
X-MultipleArgs=false
Type=Application
Encoding=UTF-8
Categories=Application;Office;
StartupNotify=false
") | sudo tee /usr/share/applications/unzip.desktop 1> /dev/null
#sudo sed -i 's:x-zip=.*:x-zip=/usr/share/applications/unzip.desktop:g' /usr/share/applications/defaults.list | grep x-zip
#sudo sed -i 's:x-zip=.*:x-zip=org.gnome.FileRoller.desktop:g' /usr/share/applications/defaults.list | grep x-zip

(echo "[Desktop Entry]
Name=l-unzip
Name[zh_CN]=l-unzip
Name[zh_TW]=l-unzip
Exec=unzip x -O gbk %U
Icon=
Terminal=false
X-MultipleArgs=false
Type=Application
Encoding=UTF-8
Categories=Application
StartupNotify=false
") | sudo tee /usr/share/applications/l-unzip.desktop 1> /dev/null
sudo sed -i 's:x-zip=.*:x-zip=/usr/share/applications/l-unzip.desktop:g' /usr/share/applications/defaults.list | grep x-zip
#sudo sed -i 's:x-zip=.*:x-zip=org.gnome.FileRoller.desktop:g' /usr/share/applications/defaults.list | grep x-zip

