@echo off
title Microsoft Edge Security Baseline - CLI Installer
echo.
echo ======================================================
echo   Applying Microsoft Edge Security Baseline Policies
echo ======================================================
echo.

:: --- SmartScreen Protection ---
echo [1/5] Enabling Microsoft Defender SmartScreen...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v SmartScreenEnabled /t REG_DWORD /d 1 /f >nul

:: --- Block Unsafe Site Override ---
echo [2/5] Blocking SmartScreen bypass prompts...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v PreventSmartScreenPromptOverride /t REG_DWORD /d 1 /f >nul

:: --- Typo-Squatting Protection ---
echo [3/5] Enabling Typo-Squatting protection...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v TypoSquattingCheckerEnabled /t REG_DWORD /d 1 /f >nul

:: --- Application Bound Encryption ---
echo [4/5] Enforcing Application-Bound Encryption...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ApplicationBoundEncryptionEnabled /t REG_DWORD /d 1 /f >nul

:: --- Remove Deprecated HTTPS-Only Mode (v142 handles automatically) ---
echo [5/5] Cleaning deprecated HTTPSOnlyMode setting (if exists)...
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v HttpsOnlyMode /f >nul 2>&1

echo.
echo ======================================================
echo   Updating Local Group Policy...
echo ======================================================
gpupdate /force

echo.
echo ✅ Baseline applied successfully.
echo Open Edge and visit:  edge://policy
echo to verify all policies show "Mandatory OK"
echo.
pause
