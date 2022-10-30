

#!/bin/bash
# -*- ENCODING: UTF-8 -*-

sudo  cp  /home/ale/vbprog/WgestionDev/*.dca  /home/ale/Ale/Repositorios/WGestionDev/
sudo  cp  /home/ale/vbprog/WgestionDev/*.dsr  /home/ale/Ale/Repositorios/WGestionDev/
sudo  cp  /home/ale/vbprog/WgestionDev/*.dsx  /home/ale/Ale/Repositorios/WGestionDev/
sudo  cp  /home/ale/vbprog/WgestionDev/*.frm  /home/ale/Ale/Repositorios/WGestionDev/
sudo  cp  /home/ale/vbprog/WgestionDev/*.frx  /home/ale/Ale/Repositorios/WGestionDev/
sudo  cp  /home/ale/vbprog/WgestionDev/*.jar  /home/ale/Ale/Repositorios/WGestionDev/
sudo  cp  /home/ale/vbprog/WgestionDev/*.vbp  /home/ale/Ale/Repositorios/WGestionDev/
sudo  cp  /home/ale/vbprog/WgestionDev/*.vbp  /home/ale/Ale/Repositorios/WGestionDev/
sudo  cp  /home/ale/vbprog/WgestionDev/*.xml  /home/ale/Ale/Repositorios/WGestionDev/
sudo  cp  /home/ale/vbprog/WgestionDev/*.bas  /home/ale/Ale/Repositorios/WGestionDev/


cd /home/ale/Ale/Repositorios/WGestionDev/

git add *

git commit -m "auto"

git push origin master


