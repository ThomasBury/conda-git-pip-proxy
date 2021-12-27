@echo off
Set proxy=%1
Set component=%2
Set priority=%3

if %component%==all ( 
    echo Configuring GIT + CONDA + PIP
    echo change the priority of conda-forge, the highest priority
    conda config --prepend channels conda-forge

    echo Change the priority of defaults, the lowest priority
    conda config --append channels defaults

    echo Prioritize channels, strict to speed up conda and for consistency
    conda config --set channel_priority %priority%
    
    echo Set proxy for conda, no pwd required
    conda config --set proxy_servers.http %proxy%
    conda config --set proxy_servers.https %proxy%
            
    echo Disabling ssl verify
    conda config --set ssl_verify False
    
    :: pip interoperability, conda can use pip-installed packages to satisfy dependencies, 
    :: cleanly remove pip-installed Write-Host('software, and replace them with conda packages when appropriate' 
    :: It may slow down conda'
    echo Pip interoperability
    conda config --set pip_interop_enabled True 
            
    echo Set proxy for pip, no pwd required
    pip config set global.proxy %proxy%
            
    echo Set the pip trusted channels
    pip config set global.trusted-host "pypi.python.org global.trusted-host pypi.org global.trusted-host files.pythonhosted.org"

    echo Set up proxy for GIT
    git config --global http.proxy %proxy%
)

if %component%==git (
    echo Configuring GIT
    echo Set up proxy for GIT
    git config --global http.proxy %proxy%
)

if %component%==conda (
    echo Configuring CONDA
    echo change the priority of conda-forge, the highest priority
    conda config --prepend channels conda-forge

    echo Change the priority of defaults, the lowest priority
    conda config --append channels defaults

    echo Prioritize channels, strict to speed up conda and for consistency
    conda config --set channel_priority %priority%
    
    echo Set proxy for conda, no pwd required
    conda config --set proxy_servers.http %proxy%
    conda config --set proxy_servers.https %proxy%
            
    echo Disabling ssl verify
    conda config --set ssl_verify False
    
    :: pip interoperability, conda can use pip-installed packages to satisfy dependencies, 
    :: cleanly remove pip-installed Write-Host('software, and replace them with conda packages when appropriate' 
    :: It may slow down conda'
    echo Pip interoperability
    conda config --set pip_interop_enabled True 
)

if %component%==pip (   
    echo Configuring PIP
    echo Set proxy for pip, no pwd required
    pip config set global.proxy %proxy%
            
    echo Set the pip trusted channels
    pip config set global.trusted-host "pypi.python.org global.trusted-host pypi.org global.trusted-host files.pythonhosted.org"

)



if %component%==conda-git (
    echo Configuring CONDA + GIT
    echo change the priority of conda-forge, the highest priority
    conda config --prepend channels conda-forge

    echo Change the priority of defaults, the lowest priority
    conda config --append channels defaults

    echo Prioritize channels, strict to speed up conda and for consistency
    conda config --set channel_priority %priority%
    
    echo Set proxy for conda, no pwd required
    conda config --set proxy_servers.http %proxy%
    conda config --set proxy_servers.https %proxy%
            
    echo Disabling ssl verify
    conda config --set ssl_verify False
    
    :: pip interoperability, conda can use pip-installed packages to satisfy dependencies, 
    :: cleanly remove pip-installed Write-Host('software, and replace them with conda packages when appropriate' 
    :: It may slow down conda'
    echo Pip interoperability
    conda config --set pip_interop_enabled True 

    echo Set up proxy for GIT
    git config --global http.proxy %proxy%
)

if %component%==conda-pip (
    echo Configuring CONDA + PIP
    echo change the priority of conda-forge, the lowest priority
    conda config --append channels conda-forge

    echo Change the priority of defaults, the highest priority
    conda config --prepend channels defaults

    echo Prioritize channels, strict to speed up conda and for consistency
    conda config --set channel_priority %priority%
    
    echo Set proxy for conda, no pwd required
    conda config --set proxy_servers.http %proxy%
    conda config --set proxy_servers.https %proxy%
            
    echo Disabling ssl verify
    conda config --set ssl_verify False
    
    :: pip interoperability, conda can use pip-installed packages to satisfy dependencies, 
    :: cleanly remove pip-installed Write-Host('software, and replace them with conda packages when appropriate' 
    :: It may slow down conda'
    echo Pip interoperability
    conda config --set pip_interop_enabled True 
            
    echo Set proxy for pip, no pwd required
    pip config set global.proxy %proxy%
            
    echo Set the pip trusted channels
    pip config set global.trusted-host "pypi.python.org global.trusted-host pypi.org global.trusted-host files.pythonhosted.org"
)

if %component%==git-pip (   
    echo Configuring GIT + PIP       
    echo Set proxy for pip, no pwd required
    pip config set global.proxy %proxy%
            
    echo Set the pip trusted channels
    pip config set global.trusted-host "pypi.python.org global.trusted-host pypi.org global.trusted-host files.pythonhosted.org"

    echo Set up proxy for GIT
    git config --global http.proxy %proxy%
)
