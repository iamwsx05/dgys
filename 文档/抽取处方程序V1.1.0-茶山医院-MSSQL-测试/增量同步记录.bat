@echo on
set path=;%cd%\jre\bin;%path%
java -Xms1024m   -Xmx1024m  -Xss1024K -XX:-UseGCOverheadLimit -jar prescriptions-mid.jar ����ͬ����¼.kjb
@rem pause
@echo off

