@echo on
setlocal

rem Copyright (c) 2024 Piotr Stradowski. All rights reserved.
rem Software distributed under the permissive MIT License.

set myPath=%~dp0

if [%sourceDir%] == [] set sourceDir="%myPath%\.."

cd %sourceDir%

echo ---- Cleaning CMake artifact files...

set "extensionsToDelete=.vcxproj .vcxproj.filters cmake_install.cmake .sln"
set "filesToDelete=CMakeCache.txt"
set "directoriesToDelete=x64;x86;bin"

for %%i in (%extensionsToDelete%) do (
    for %%f in (%sourceDir%\*) do (
        if "%%~xf" == "%%i" (
            echo Deleting "%%f"
            del /q "%%f"
        )
    )
)

for %%f in (%filesToDelete%) do (
    echo Deleting "%%f"
    del /q "%sourceDir%\%%f"
)

for %%d in (%directoriesToDelete%) do (
    echo Deleting directory "%%d"
    rmdir /s /q "%sourceDir%\%%d"
)

echo ---- Cleaning CMake artifact directories...

pause
exit

:Error_CMakeDirectoryNotExist
echo "Could not find CMake directory."
pause
goto:eof