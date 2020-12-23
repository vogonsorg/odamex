Set-Variable -Name "OdamexVersion" -Value "0.9.0"

Set-Variable -Name "CommonDir" -Value "${PSScriptRoot}\OutCommon"
Set-Variable -Name "DebugDir" -Value "${PSScriptRoot}\OutDebug"
Set-Variable -Name "X64Dir" -Value "${PSScriptRoot}\OutX64"
Set-Variable -Name "X86Dir" -Value "${PSScriptRoot}\OutX86"
Set-Variable -Name "OutputDir" -Value "${PSScriptRoot}\Output"

function BuildX64 {
    Remove-Item -Recurse -Path "${PSScriptRoot}\BuildX64"
    New-Item  -Force -ItemType "directory" -Path "${PSScriptRoot}\BuildX64"
    Set-Location -Path "${PSScriptRoot}\BuildX64"
    
    cmake.exe -G "Visual Studio 16 2019" -A "x64" "${PSScriptRoot}\..\.." `
        -DBUILD_OR_FAIL=1 `
        -DBUILD_CLIENT=1 -DBUILD_SERVER=1 `
        -DBUILD_MASTER=1 -DBUILD_LAUNCHER=1
    cmake.exe --build . --config RelWithDebInfo --parallel

    Set-Location -Path "${PSScriptRoot}"
}

function BuildX86 {
    Remove-Item -Recurse -Path "${PSScriptRoot}\BuildX86"
    New-Item  -Force -ItemType "directory" -Path "${PSScriptRoot}\BuildX86"
    Set-Location -Path "${PSScriptRoot}\BuildX86"
    
    cmake.exe -G "Visual Studio 16 2019" -A "Win32" "${PSScriptRoot}\..\.." `
        -DBUILD_OR_FAIL=1 `
        -DBUILD_CLIENT=1 -DBUILD_SERVER=1 `
        -DBUILD_MASTER=1 -DBUILD_LAUNCHER=1
    cmake.exe --build . --config RelWithDebInfo --parallel

    Set-Location -Path "${PSScriptRoot}"
}

function CopyFiles {
    New-Item -Force -ItemType "directory" -Path "${CommonDir}"
    New-Item -Force -ItemType "directory" -Path "${CommonDir}\config-samples"
    New-Item -Force -ItemType "directory" -Path "${CommonDir}\licenses"

    Copy-Item -Force -Path "${PSScriptRoot}\..\..\3RD-PARTY-LICENSES" `
        -Destination "${CommonDir}\3RD-PARTY-LICENSES.txt"
    Copy-Item -Force -Path "${PSScriptRoot}\..\..\CHANGELOG" `
        -Destination "${CommonDir}\CHANGELOG.txt"
    Copy-Item -Force -Path "${PSScriptRoot}\..\..\config-samples\*" `
        -Destination "${CommonDir}\config-samples"
    Copy-Item -Force -Path "${PSScriptRoot}\..\..\libraries\curl\COPYING" `
        -Destination "${CommonDir}\licenses\COPYING.curl.txt"
    Copy-Item -Force -Path "${PSScriptRoot}\..\..\libraries\libminiupnpc\LICENSE" `
        -Destination "${CommonDir}\licenses\LICENSE.libminiupnpc.txt"
    Copy-Item -Force -Path "${PSScriptRoot}\..\..\libraries\libpng\LICENSE" `
        -Destination "${CommonDir}\licenses\LICENSE.libpng.txt"
    Copy-Item -Force -Path "${PSScriptRoot}\..\..\libraries\portmidi\license.txt" `
        -Destination "${CommonDir}\licenses\license.portmidi.txt"
    Copy-Item -Force -Path "${PSScriptRoot}\..\..\LICENSE" `
        -Destination "${CommonDir}\LICENSE.txt"
    Copy-Item -Force -Path "${PSScriptRoot}\..\..\MAINTAINERS" `
        -Destination "${CommonDir}\MAINTAINERS.txt"
    Copy-Item -Force -Path "${PSScriptRoot}\..\..\wad\odamex.wad" `
        -Destination "${CommonDir}"
    Copy-Item -Force -Path "${PSScriptRoot}\BuildX64\libraries\SDL2_mixer-2.0.4\COPYING.txt" `
        -Destination "${CommonDir}\licenses\COPYING.SDL2_mixer.txt"
    Copy-Item -Force -Path "${PSScriptRoot}\BuildX64\libraries\SDL2_mixer-2.0.4\lib\x64\LICENSE.FLAC.txt" `
        -Destination "${CommonDir}\licenses"
    Copy-Item -Force -Path "${PSScriptRoot}\BuildX64\libraries\SDL2_mixer-2.0.4\lib\x64\LICENSE.modplug.txt" `
        -Destination "${CommonDir}\licenses"
    Copy-Item -Force -Path "${PSScriptRoot}\BuildX64\libraries\SDL2_mixer-2.0.4\lib\x64\LICENSE.mpg123.txt" `
        -Destination "${CommonDir}\licenses"
    Copy-Item -Force -Path "${PSScriptRoot}\BuildX64\libraries\SDL2_mixer-2.0.4\lib\x64\LICENSE.ogg-vorbis.txt" `
        -Destination "${CommonDir}\licenses"
    Copy-Item -Force -Path "${PSScriptRoot}\BuildX64\libraries\SDL2_mixer-2.0.4\lib\x64\LICENSE.opus.txt" `
        -Destination "${CommonDir}\licenses"
    Copy-Item -Force -Path "${PSScriptRoot}\BuildX64\libraries\SDL2_mixer-2.0.4\lib\x64\LICENSE.opusfile.txt" `
        -Destination "${CommonDir}\licenses"
    Copy-Item -Force -Path "${PSScriptRoot}\BuildX64\libraries\SDL2-2.0.12\COPYING.txt" `
        -Destination "${CommonDir}\licenses\COPYING.SDL2.txt"

    New-Item -Force -ItemType "directory" -Path "${DebugDir}"

    ########################################
    ## 64-BIT FILES
    ########################################

    New-Item -Force -ItemType "directory" -Path "${X64Dir}"

    Copy-Item -Force -Path `
        "${PSScriptRoot}\BuildX64\client\RelWithDebInfo\libFLAC-8.dll", `
        "${PSScriptRoot}\BuildX64\client\RelWithDebInfo\libmodplug-1.dll", `
        "${PSScriptRoot}\BuildX64\client\RelWithDebInfo\libmpg123-0.dll", `
        "${PSScriptRoot}\BuildX64\client\RelWithDebInfo\libogg-0.dll", `
        "${PSScriptRoot}\BuildX64\client\RelWithDebInfo\libopus-0.dll", `
        "${PSScriptRoot}\BuildX64\client\RelWithDebInfo\libvorbis-0.dll", `
        "${PSScriptRoot}\BuildX64\client\RelWithDebInfo\libvorbisfile-3.dll", `
        "${PSScriptRoot}\BuildX64\client\RelWithDebInfo\odamex.exe", `
        "${PSScriptRoot}\BuildX64\client\RelWithDebInfo\SDL2_mixer.dll", `
        "${PSScriptRoot}\BuildX64\client\RelWithDebInfo\SDL2.dll", `
        "${PSScriptRoot}\BuildX64\odalaunch\RelWithDebInfo\odalaunch.exe", `
        "${PSScriptRoot}\BuildX64\odalaunch\RelWithDebInfo\wxbase314u_net_vc14x_x64.dll", `
        "${PSScriptRoot}\BuildX64\odalaunch\RelWithDebInfo\wxbase314u_vc14x_x64.dll", `
        "${PSScriptRoot}\BuildX64\odalaunch\RelWithDebInfo\wxbase314u_xml_vc14x_x64.dll", `
        "${PSScriptRoot}\BuildX64\odalaunch\RelWithDebInfo\wxmsw314u_core_vc14x_x64.dll", `
        "${PSScriptRoot}\BuildX64\odalaunch\RelWithDebInfo\wxmsw314u_html_vc14x_x64.dll", `
        "${PSScriptRoot}\BuildX64\odalaunch\RelWithDebInfo\wxmsw314u_xrc_vc14x_x64.dll", `
        "${PSScriptRoot}\BuildX64\server\RelWithDebInfo\odasrv.exe" `
        -Destination "${X64Dir}\"

    Copy-Item -Force -Path `
        "${PSScriptRoot}\BuildX64\client\RelWithDebInfo\odamex.pdb" `
        -Destination "${DebugDir}\odamex.x64.pdb"
    Copy-Item -Force -Path `
        "${PSScriptRoot}\BuildX64\server\RelWithDebInfo\odasrv.pdb" `
        -Destination "${DebugDir}\odasrv.x64.pdb"
    Copy-Item -Force -Path `
        "${PSScriptRoot}\BuildX64\odalaunch\RelWithDebInfo\odalaunch.pdb" `
        -Destination "${DebugDir}\odalaunch.x64.pdb"

    ########################################
    ## 32-BIT FILES
    ########################################

    New-Item -Force -ItemType "directory" -Path "${X86Dir}"

    Copy-Item -Force -Path `
        "${PSScriptRoot}\BuildX86\client\RelWithDebInfo\libFLAC-8.dll", `
        "${PSScriptRoot}\BuildX86\client\RelWithDebInfo\libmodplug-1.dll", `
        "${PSScriptRoot}\BuildX86\client\RelWithDebInfo\libmpg123-0.dll", `
        "${PSScriptRoot}\BuildX86\client\RelWithDebInfo\libogg-0.dll", `
        "${PSScriptRoot}\BuildX86\client\RelWithDebInfo\libopus-0.dll", `
        "${PSScriptRoot}\BuildX86\client\RelWithDebInfo\libvorbis-0.dll", `
        "${PSScriptRoot}\BuildX86\client\RelWithDebInfo\libvorbisfile-3.dll", `
        "${PSScriptRoot}\BuildX86\client\RelWithDebInfo\odamex.exe", `
        "${PSScriptRoot}\BuildX86\client\RelWithDebInfo\SDL2_mixer.dll", `
        "${PSScriptRoot}\BuildX86\client\RelWithDebInfo\SDL2.dll", `
        "${PSScriptRoot}\BuildX86\odalaunch\RelWithDebInfo\odalaunch.exe", `
        "${PSScriptRoot}\BuildX86\odalaunch\RelWithDebInfo\wxbase314u_net_vc14x.dll", `
        "${PSScriptRoot}\BuildX86\odalaunch\RelWithDebInfo\wxbase314u_vc14x.dll", `
        "${PSScriptRoot}\BuildX86\odalaunch\RelWithDebInfo\wxbase314u_xml_vc14x.dll", `
        "${PSScriptRoot}\BuildX86\odalaunch\RelWithDebInfo\wxmsw314u_core_vc14x.dll", `
        "${PSScriptRoot}\BuildX86\odalaunch\RelWithDebInfo\wxmsw314u_html_vc14x.dll", `
        "${PSScriptRoot}\BuildX86\odalaunch\RelWithDebInfo\wxmsw314u_xrc_vc14x.dll", `
        "${PSScriptRoot}\BuildX86\server\RelWithDebInfo\odasrv.exe" `
        -Destination "${X86Dir}\"

    Copy-Item -Force -Path `
        "${PSScriptRoot}\BuildX86\client\RelWithDebInfo\odamex.pdb" `
        -Destination "${DebugDir}\odamex.x86.pdb"
    Copy-Item -Force -Path `
        "${PSScriptRoot}\BuildX86\server\RelWithDebInfo\odasrv.pdb" `
        -Destination "${DebugDir}\odasrv.x86.pdb"
    Copy-Item -Force -Path `
        "${PSScriptRoot}\BuildX86\odalaunch\RelWithDebInfo\odalaunch.pdb" `
        -Destination "${DebugDir}\odalaunch.x86.pdb"
}

function Archives {
    New-Item  -Force -ItemType "directory" -Path "${OutputDir}"

    7z.exe a "${OutputDir}\odamex-win64-${OdamexVersion}.zip" `
        "${CommonDir}\*" "${X64Dir}\*"
    7z.exe a "${OutputDir}\odamex-win32-${OdamexVersion}.zip" `
        "${CommonDir}\*" "${X86Dir}\*"
}

function Installer {
    ISCC.exe odamex.iss
}

#BuildX64
#BuildX86
#CopyFiles
Archives
Installer
