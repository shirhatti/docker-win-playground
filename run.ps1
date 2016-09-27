<#
.SYNOPSIS
    Run ASP.NET Sample Image
.DESCRIPTION
    Runs ASP.NET Sample Image
#>

Set-StrictMode -Version Latest
$ErrorActionPreference="Stop"
$ProgressPreference="SilentlyContinue"

function Invoke-Docker-Build ([string]$ImageName, [string]$ImagePath, [string]$DockerBuildArgs = "") {
    echo "docker build -t $ImageName $ImagePath $DockerBuildArgs"
    Invoke-Expression "docker build -t $ImageName $ImagePath $DockerBuildArgs"
}

function Invoke-MSBuild ([string]$MSBuildPath, [string]$MSBuildParameters) {
    Invoke-Expression "$MSBuildPath $MSBuildParameters"
}

function Invoke-NugetRestore ([string]$PackageConfigPath, [string]$OutputDirectory) {
    Invoke-Expression "NuGet.exe install $PackageConfigPath -OutputDirectory $OutputDirectory"
}

Invoke-NugetRestore -PackageConfigPath ".\samples\HelloMVC\HelloMVC\packages.config" -OutputDirectory "samples\HelloMVC\packages"
Invoke-MSBuild -MSBuildPath "MSBuild.exe" -MSBuildParameters ".\samples\HelloMVC\HelloMVC.sln /p:DeployOnBuild=true /p:PublishProfile=LocalFileSystem.pubxml"
Invoke-Docker-Build -ImageName "hellomvc" -ImagePath ".\samples\HelloMVC\"