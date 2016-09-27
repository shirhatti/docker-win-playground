<#
.SYNOPSIS
    Build IIS and ASP.NET images
.DESCRIPTION
    Builds shirhatti/iis and shirhatti/aspnet images with the latest tag
#>

Set-StrictMode -Version Latest
$ErrorActionPreference="Stop"
$ProgressPreference="SilentlyContinue"

$Organization="shirhatti"
$Tag="latest"
$DockerBuildArgs = ""

function Invoke-Docker-Build ([string]$ImageName, [string]$ImagePath) {
    Invoke-Expression "docker build -t $ImageName $ImagePath $DockerBuildArgs"
}

function Set-IIS-Image() {
    $IISImageName = $organization + "/iis:" + $Tag
    $IISImagePath = "iis"
    Invoke-Docker-Build -ImageName $IISImageName -ImagePath $IISImagePath
}

function Set-ASPNET-Image() {
    $IISImageName = $organization + "/aspnet:" + $Tag
    $IISImagePath = "aspnet"
    Invoke-Docker-Build -ImageName $IISImageName -ImagePath $IISImagePath
}

Set-IIS-Image
Set-ASPNET-Image
