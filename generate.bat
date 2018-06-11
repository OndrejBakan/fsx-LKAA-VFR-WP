@ECHO OFF

CHCP 65001 > NUL

SETLOCAL ENABLEEXTENSIONS

REM set path to your bglcomp.exe
SET path_bglcomp=c:\Program Files (x86)\Lockheed Martin\Prepar3D SDK 1.4.4747.0\Environment Kit\BGL Compiler SDK\bglcomp.exe

REM Generate BGL files from XML files.
ECHO LKAA-VFR-WP: Generuji BGL soubory.
FOR %%f IN (%~dp0src\*.xml) DO "%path_bglcomp%" "%%~ff" > NUL

REM Create LKAA-VFR-WP\scenery, if it does not exist.
md "%~dp0LKAA-VFR-WP\scenery" 2> NUL

REM Move BGL files to LKAA-VFR-WP\scenery.
ECHO LKAA-VFR-WP: Kopíruji vygenerované BGL soubory do LKAA-VFR-WP\scenery.
move "%~dp0src\*.bgl" "%~dp0LKAA-VFR-WP\scenery" > NUL

ECHO LKAA-VFR-WP: Hotovo.
