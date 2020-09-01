@echo on
set path=;%cd%\jre\bin;%path%
java -Xms1024m   -Xmx1024m  -Xss1024K -XX:-UseGCOverheadLimit -jar prescriptions-mid.jar 同步his基础数据.kjb
@rem pause
@echo off


