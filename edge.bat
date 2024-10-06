@echo off

echo Microsoft Edge 정책 삭제를 시작합니다...

REM 레지스트리에서 Edge 정책 값 삭제 (HKEY_LOCAL_MACHINE)
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge" /v Edge3PSerpTelemetryEnabled /f
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge" /v ExtensionManifestV2Availability /f
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge" /v PersonalizationReportingEnabled /f
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge" /v SpotlightExperiencesAndRecommendationsEnabled /f
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge" /v UserFeedbackAllowed /f
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge" /v MetricsReportingEnabled /f

REM 레지스트리에서 Edge 정책 값 삭제 (HKEY_CURRENT_USER)
reg delete "HKEY_CURRENT_USER\Software\Policies\Microsoft\Edge" /v PersonalizationReportingEnabled /f
reg delete "HKEY_CURRENT_USER\Software\Policies\Microsoft\Edge" /v SpotlightExperiencesAndRecommendationsEnabled /f
reg delete "HKEY_CURRENT_USER\Software\Policies\Microsoft\Edge" /v UserFeedbackAllowed /f
reg delete "HKEY_CURRENT_USER\Software\Policies\Microsoft\Edge" /v MetricsReportingEnabled /f

REM 레지스트리 키 자체 삭제 (전체 정책 삭제)
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Edge" /f
reg delete "HKEY_CURRENT_USER\Software\Policies\Microsoft\Edge" /f

REM 정책 적용 디렉터리 삭제
rmdir /s /q "%ProgramFiles(x86)%\Microsoft\Policies"

echo 모든 정책이 삭제되었습니다.

REM 브라우저 재시작 안내
echo Microsoft Edge를 재시작해야 정책이 적용됩니다.
echo 계속하려면 Enter 키를 누르세요...
pause
