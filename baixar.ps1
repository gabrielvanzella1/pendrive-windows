# Baixa o que faltar: Rufus portatil e ISO oficial do Windows 11 (pt-BR, x64).
$ErrorActionPreference = 'Stop'
[Net.ServicePointManager]::SecurityProtocol = 'Tls12'
Set-Location $PSScriptRoot
$iso = 'Win11_ptBR_x64.iso'

if (-not (Test-Path rufus.exe)) {
    Write-Host 'Baixando Rufus...'
    $r = Invoke-RestMethod https://api.github.com/repos/pbatard/rufus/releases/latest
    $a = $r.assets | Where-Object name -match '^rufus-[\d.]+p\.exe$' | Select-Object -First 1
    Invoke-WebRequest $a.browser_download_url -OutFile rufus.exe -UseBasicParsing
}

if (-not (Test-Path $iso)) {
    Write-Host 'Pegando link oficial da Microsoft (Fido)...'
    $fido = Join-Path $env:TEMP 'Fido.ps1'
    Invoke-WebRequest https://raw.githubusercontent.com/pbatard/Fido/master/Fido.ps1 -OutFile $fido -UseBasicParsing
    $url = powershell -NoProfile -ExecutionPolicy Bypass -File $fido -Win 11 -Rel Latest -Lang Brazil -Arch x64 -GetUrl | Select-Object -Last 1
    if ($url -notmatch '^https://') { throw "Microsoft recusou o link ($url). Espere uns minutos e rode de novo, ou baixe em https://www.microsoft.com/pt-br/software-download/windows11 e salve como $iso nesta pasta." }

    Write-Host 'Baixando ISO (~8 GB, continua de onde parou se cair)...'
    curl.exe -L -C - --retry 5 -o "$iso.part" $url
    if ($LASTEXITCODE) { throw "Download falhou (curl $LASTEXITCODE). Rode de novo para continuar." }
    Move-Item "$iso.part" $iso
}
