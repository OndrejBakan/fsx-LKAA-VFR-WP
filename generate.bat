@ECHO OFF

SETLOCAL ENABLEEXTENSIONS

@REM set path to your bglcomp.exe
SET path_bglcomp=c:\Program Files (x86)\Lockheed Martin\Prepar3D SDK 1.4.4747.0\Environment Kit\BGL Compiler SDK\bglcomp.exe

@REM generate BGL files from XML files
ECHO "Generuji BGL soubory."
FOR %%f IN (%~dp0src\*.xml) DO "%path_bglcomp%" "%%~ff" > NUL

@REM Create LKAA-VFR-WP\Scenery, if it does not exist.
md "%~dp0LKAA-VFR-WP\Scenery" 2> NUL

@REM move BGL files to LKAA-VFR-WP\Scenery
ECHO "Kop¡ruji vygenerovan‚ BGL soubory do LKAA-VFR-WP\Scenery."
move "%~dp0src\*.bgl" "%~dp0LKAA-VFR-WP\Scenery" > NUL

ECHO "Hotovo."
