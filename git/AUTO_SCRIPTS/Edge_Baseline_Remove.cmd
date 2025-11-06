@echo off
title Microsoft Edge Security Baseline - Rollback
echo.
echo ======================================================
echo   Removing Microsoft Edge Security Baseline Policies
echo ======================================================
echo.

:: --- SmartScreen Protection ---
echo [1/5] Removing SmartScreen policy...
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v SmartScreenEnabled /f >nul 2>&1

:: --- Block Unsafe Site Override ---
echo [2/5] Removing SmartScreen prompt override block...
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v PreventSmartScreenPromptOverride /f >nul 2>&1

:: --- Typo-Squatting Protection ---
echo [3/5] Removing Typo-Squatting protection policy...
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v TypoSquattingCheckerEnabled /f >nul 2>&1

:: --- Application Bound Encryption ---
echo [4/5] Removing Application-Bound Encryption policy...
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v ApplicationBoundEncryptionEnabled /f >nul 2>&1

:: --- HTTPSOnlyMode (just in case it still exists) ---
echo [5/5] Removing any deprecated HTTPSOnlyMode policy...
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v HttpsOnlyMode /f >nul 2>&1

echo.
echo ======================================================
echo   Refreshing Local Group Policy...
echo ======================================================
gpupdate /force

echo.
echo ✅ All Microsoft Edge baseline policies have been removed.
echo Edge is now restored to default (no enforced policies).
echo.
pause
