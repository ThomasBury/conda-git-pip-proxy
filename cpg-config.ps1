param (
    [string]$proxy,
    [string]$component = "all",
    [string]$priority = "flexible"
)

if ($component -eq "all" -or $component -eq "conda" -or $component -eq "git-conda" -or $component -eq "conda-pip") {
    Write-Output "Configuring CONDA"
    
    # Set Conda channels
    conda config --prepend channels conda-forge
    conda config --append channels defaults
    conda config --set channel_priority $priority

    # Set Conda proxy
    conda config --set proxy_servers.http $proxy
    conda config --set proxy_servers.https $proxy
    conda config --set ssl_verify False
    conda config --set pip_interop_enabled True
}

if ($component -eq "all" -or $component -eq "pip" -or $component -eq "git-pip" -or $component -eq "conda-pip") {
    Write-Output "Configuring PIP"

    # Set pip proxy
    pip config set global.proxy $proxy
    pip config set global.trusted-host "pypi.python.org global.trusted-host pypi.org global.trusted-host files.pythonhosted.org"
}

if ($component -eq "all" -or $component -eq "git" -or $component -eq "git-conda" -or $component -eq "git-pip") {
    Write-Output "Configuring GIT"

    # Set git proxy
    git config --global http.proxy $proxy
}


