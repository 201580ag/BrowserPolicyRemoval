@echo off

echo 첫 번째 방법을 시도합니다...

REM 1. 레지스트리 키에서 CloudManagementEnrollmentToken 값 삭제
reg delete "HKEY_CURRENT_USER\Software\Google\Chrome" /v CloudManagementEnrollmentToken /f
reg delete "HKEY_CURRENT_USER\Software\Policies\Google\Chrome" /v CloudManagementEnrollmentToken /f
reg delete "HKEY_LOCAL_MACHINE\Software\Google\Chrome" /v CloudManagementEnrollmentToken /f
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Google\Chrome" /v CloudManagementEnrollmentToken /f
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Google\Update" /v CloudManagementEnrollmentToken /f
reg delete "HKEY_LOCAL_MACHINE\Software\WOW6432Node\Google\Enrollment" /v CloudManagementEnrollmentToken /f
reg delete "HKEY_LOCAL_MACHINE\Software\WOW6432Node\Google\Update\ClientState\{430FD4D0-B729-4F61-AA34-91526481799D}" /v CloudManagementEnrollmentToken /f

REM Google 업데이트에서 캐시된 클라우드 정책 작성 디렉터리 삭제
rmdir /s /q "%ProgramFiles(x86)%\Google\Policies"

echo 첫 번째 방법 완료. 두 번째 방법을 시도합니다...

REM 2. 레지스트리에서 정책 값 삭제
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Google\Chrome" /v ExtensionManifestV2Availability /f
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Google\Chrome" /v MetricsReportingEnabled /f
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Google\Chrome" /v UserFeedbackAllowed /f
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Google\Chrome" /v ChromeCleanupEnabled /f
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Google\Chrome" /v ChromeCleanupReportingEnabled /f
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Google\Chrome" /v DeviceMetricsReportingEnabled /f

REM 레지스트리 키 자체 삭제 (전체 정책 삭제)
reg delete "HKEY_LOCAL_MACHINE\Software\Policies\Google\Chrome" /f

REM Google 정책 경로 삭제
rmdir /s /q "%ProgramFiles(x86)%\Google\Policies"

echo 두 번째 방법 완료. 모든 정책이 삭제되었습니다.

REM 브라우저 재시작 안내
echo Google Chrome을 재시작해야 정책이 적용됩니다.
echo 계속하려면 Enter 키를 누르세요...
pause
