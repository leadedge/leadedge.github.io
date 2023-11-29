@echo off
Pushd "%~dp0"
REG DELETE "HKCU\Software\Leading Edge\Spout" /v DX9 /f nul 2> nul
REG DELETE "HKCU\Software\Leading Edge\Spout" /v Memoryshare /f > nul 2> nul
