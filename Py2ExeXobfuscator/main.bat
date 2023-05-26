@echo off
cls
color 4
title Py2ExeXobfuscator @DARKNOSY
type menu.txt

Set /p action="Which option are you choosing?: "
if '%action%'=='1' goto Py2ExeXobfuscator
if '%action%'=='2' goto Py2Exe
if '%action%'=='3' goto Obfuscator
if '%action%'=='4' goto leave

:Obfuscator
title Obfuscator @DARKNOSY
cls
set /p type="Is the type of python file you want to obfuscate a .py or a .pyw?(py/pyw):   "
if '%type%'=='py' goto obfp
if '%type%'=='pyw' goto obfw

:obfp
cls
set /p file="What's the name of the python file you want to obfuscate?  (file must be in the folder as this program) (don't type .py/.pyw):  "
cls
set /p nname="What do you want the name of the output file to be (don't use a space in the name, use "-" instead):   "
cls
python OBF.py %file%.py -o %nname%.py
set /p action= Do you want to test your file? (y/n) 
 if '%action%'=='y' goto oy
 if '%action%'=='n' goto leave
exit

:obfw
cls
set /p file="What's the name of the python file you want to obfuscate?(file must be in the folder as this program) (don't type .py/.pyw):  "
cls
set /p nname="What do you want the name of the output file to be (don't use a space in the name, use "-" instead):   "
cls
python OBF.py %file%.pyw -o %nname%.pyw
Echo Done !
set /p action= Do you want to test your file? (y/n) 
 if '%action%'=='y' goto oy
 if '%action%'=='n' goto leave
exit

:oy
python %file%.%type%
goto leave

:Py2Exe
title Py2Exe @DARKNOSY
cls
pip install pyinstaller
cls
set /p type="Is the type of python file you want to turn into an executable a .py or a .pyw?(py/pyw):   "
cls
set /p file="What's the name of the python file you want to turn into an executable? (file must be in the folder as this program)    (don't type .py/pyw) (name must not have a space in it's name):   "
cls
set /p nname="What do you want the name of the output file to be (don't use a space in the name, use "-" instead):   "
cls
set /p q="Do you want to add a icon to the outputed file (y/n):   "
if '%q%'=='y' goto p2exoi
if '%q%'=='n' goto py2exoni

:p2exoi
cls
set /p icon="What's the name of the .ico file you want to be the icon of the ouputed file? (file has to be in the same folder as this program):   "
cls
pyinstaller --onefile %file%.py --clean --noconsole -i %icon%.ico -n %nname% 
cls
Echo Done !
set /p action= Do you want to test your file? (y/n)    
if '%action%'=='y' goto p2ey
if '%action%'=='n' goto leave
exit

:py2exoni
cls
pyinstaller --onefile %file%.py -n %nname% 
cls
Echo Done !
set /p action= Do you want to test your file? (y/n)    
if '%action%'=='y' goto p2ey
if '%action%'=='n' goto leave
exit

:p2ey
del /q %nname%.spec
del /s /q "%cd%\build"
start %cd%\dist\%nname%.exe
goto leave

:Py2ExeXobfuscator
title Setup @DARKNOSY
cls
pip install pyinstaller
cls
title Obfuscator @DARKNOSY
set /p file="What's the name of the python file you want to turn into an executable? (file must be in the folder as this program)    (don't type .py/pyw) (name must not have a space in it's name):   "
cls
set /p nname="What do you want the name of the output file to be (don't use a space in the name, use "-" instead):   "
cls
set /p type="Is the type of python file you want to obfuscate a .py or a .pyw?(py/pyw):   "
if '%type%'=='py' goto obfp2
if '%type%'=='pyw' goto obfw2

:p2ey2
start %cd%\dist\%nname%.exe
goto leave

:obfp2
cls
python OBF.py %file%.py -o %nname%.py
echo Done!
goto Py2ExeXobfuscator2

:obfw2
cls
python OBF.py %file%.pyw -o %nname%.pyw
Echo Done!
goto Py2ExeXobfuscator2

:py2exoi2
cls
set /p icon="What's the name of the .ico file you want to be the icon of the ouputed file? (file has to be in the same folder as this program):   "
cls
pyinstaller --onefile %file%.py --clean --noconsole -i %icon%.ico -n %nname% 
cls
goto Py2ExeXobfuscator3

:py2exoni2
cls
pyinstaller --onefile %file%.py -n %nname% 
cls
goto Py2ExeXobfuscator3

:oy
python %file%.%type%
goto leave

:Py2ExeXobfuscator2
cls
title Py2Exe @DARKNOSY
cls
set /p q="Do you want to add a icon to the outputed file (y/n):   "
if '%q%'=='y' goto py2exoi2
if '%q%'=='n' goto py2exoni2

:Py2ExeXobfuscator3
cls
del /q %nname%.spec
del /s /q "%cd%\build"
if exist %nname%.%type% del /q %nname%.%type%
cls
title Done! @DARKNOSY
echo Done!
set /p action= Do you want to test your file? (y/n):    
if '%action%'=='y' goto p2ey2
if '%action%'=='n' goto leave
exit

:leave 
cls 
title Thank you! @DARKNOSY
echo Thank you for Using Py2ExeXobfuscator!
PAUSE
exit
