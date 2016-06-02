#!/bin/bash

#3. Create a new directory for development in your home directory, and cd into it

mkdir remmina_devel
cd remmina_devel

#4. Download the latest source code of FreeRDP from its master branch

git clone https://github.com/FreeRDP/FreeRDP.git
cd FreeRDP

#5. Configure FreeRDP for compilation (don't forget to include -DWITH_PULSE=ON)

cmake -DCMAKE_BUILD_TYPE=Debug -DWITH_SSE2=ON -DWITH_CUPS=on -DWITH_WAYLAND=off -DWITH_PULSE=on -DCMAKE_INSTALL_PREFIX:PATH=/usr/local .


#6. Compile FreeRDP and install

make && checkinstall make install

#7. Make your system dynamic loader aware of the new libraries you installed. For Ubuntu x64:

echo /usr/local/lib | sudo tee /etc/ld.so.conf.d/freerdp_devel.conf > /dev/null
sudo ldconfig

#8. Create a symbolik link to the executable in /usr/local/bin
#ln -s /opt/remmina_devel/freerdp/bin/xfreerdp /usr/local/bin/

#9. Test the new freerdp by connecting to a RDP host
#Note: Requires -v /tmp/.X11-unix:/tmp/.X11-unix

xfreerdp +clipboard /sound:rate:44100,channel:2 /v:hostname /u:username

#10. Now clone remmina repository, "next" branch, to your devel dir:

cd ..
git clone https://github.com/FreeRDP/Remmina.git -b next

#11. Configure Remmina for compilation

cd Remmina
cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX:PATH=/usr/local -DCMAKE_PREFIX_PATH=/usr/local --build=build .

#12. Compile remmina and install it

make && checkinstall make install


#13. Create a symbolik link to the the executable
#sudo ln -s /opt/remmina_devel/remmina/bin/remmina /usr/local/bin/

#14. Run remmina

remmina

