@echo off

REM Check if Chocolatey is installed
where choco >nul 2>nul
if %errorlevel% neq 0 (
    echo Chocolatey is not installed. Installing Chocolatey...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
)

REM Install kubectl using Chocolatey
echo Installing kubectl...
choco install kubernetes-cli -y

REM Install Helm using Chocolatey
echo Installing Helm...
choco install kubernetes-helm -y

REM Install metrics-server
echo Installing metrics-server...
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

REM Install nginx-ingress-controller
echo Installing nginx-ingress-controller...
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/cloud/deploy.yaml