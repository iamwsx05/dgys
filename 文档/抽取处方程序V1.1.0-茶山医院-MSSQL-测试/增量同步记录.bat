@echo on
set path=;%cd%\jre\bin;%path%
java -Xms1024m   -Xmx1024m  -Xss1024K -XX:-UseGCOverheadLimit -jar prescriptions-mid.jar 增量同步记录.kjb
@rem pause
@echo off

