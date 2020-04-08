@echo off
set date_str=%date:~-10,4%%date:~-5,2%%date:~-2,2%
rem echo %date_str%Å@
set time_str=%time: =0%
set time_str=%time_str:~0,2%%time_str:~3,2%%time_str:~6,2%
rem echo %time_str%

echo F | xcopy /Y clipboard.html backup\%date_str%_%time_str%_clipboard.html
xcopy /Y tmpl\clipboard.html clipboard.html

