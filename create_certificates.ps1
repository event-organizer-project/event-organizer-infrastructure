# Specify the relative path for the src folder
$srcFolderPath = Join-Path -Path $PSScriptRoot -ChildPath "src"

# If the src folder doesn't exist, create it
if (-not (Test-Path $srcFolderPath -PathType Container)) {
    New-Item -ItemType Directory -Path $srcFolderPath
}

# Create self-signed SSL certificate for localhost
$cert = New-SelfSignedCertificate -DnsName @("localhost") -CertStoreLocation "cert:\LocalMachine\My"

$certKeyPath = Join-Path -Path $srcFolderPath -ChildPath "localhost.pfx"
$password = ConvertTo-SecureString 'password' -AsPlainText -Force
$cert | Export-PfxCertificate -FilePath $certKeyPath -Password $password
$rootCert = $(Import-PfxCertificate -FilePath $certKeyPath -CertStoreLocation 'Cert:\LocalMachine\Root' -Password $password)

# Create self-signed SSL certificate for host.docker.internal
$cert = New-SelfSignedCertificate -DnsName @("host.docker.internal") -CertStoreLocation "cert:\LocalMachine\My"

$certKeyPath = Join-Path -Path $srcFolderPath -ChildPath "host.docker.internal.pfx"
$cert | Export-PfxCertificate -FilePath $certKeyPath -Password $password
$rootCert = $(Import-PfxCertificate -FilePath $certKeyPath -CertStoreLocation 'Cert:\LocalMachine\Root' -Password $password)
