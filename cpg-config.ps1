param ($proxy, $component="all", $priority='flexible')




If($component -eq "all") 
{ 
    Write-Output "Configuring GIT + CONDA + PIP"
    Write-Host('change the priority of conda-forge, the lowest priority')
    conda config --append channels conda-forge

    Write-Host('change the priority of defaults, the highest priority')
    conda config --prepend channels defaults

    Write-Host('prioritize channels, strict to speed up conda and for consistency')
    conda config --set channel_priority $priority
    
    Write-Host('set proxy for conda, no pwd required')
    conda config --set proxy_servers.http $proxy
    conda config --set proxy_servers.https $proxy
            
    Write-Host('disabling ssl verify')
    conda config --set ssl_verify False
    
    # pip interoperability, conda can use pip-installed packages to satisfy dependencies, cleanly remove pip-installed Write-Host('software, and replace them with conda packages when appropriate')
    # It may slow down conda'
    conda config --set pip_interop_enabled True 
            
    Write-Host('set proxy for pip, no pwd required')
    pip config set global.proxy $proxy
            
    Write-Host('set the pip trusted channels')
    pip config set global.trusted-host pypi.python.org
    pip config set global.trusted-host pypi.org
    pip config set global.trusted-host files.pythonhosted.org

    Write-Host('set up proxy for GIT')
    git config --global http.proxy $proxy
}elseif($component -eq "git") 
{ 
    Write-Output "Configuring only GIT"
    Write-Host('set up proxy for GIT')
    git config --global http.proxy $proxy
}elseif($component -eq "pip") 
{ 
    Write-Output "Configuring only PIP" 
    Write-Host('set proxy for pip, no pwd required')
    pip config set global.proxy $proxy
            
    Write-Host('set the pip trusted channels')
    pip config set global.trusted-host pypi.python.org
    pip config set global.trusted-host pypi.org
    pip config set global.trusted-host files.pythonhosted.org

}elseif($component -eq "conda") 
{ 
    Write-Output "Configuring oly CONDA"
    Write-Host('change the priority of conda-forge, the lowest priority')
    conda config --append channels conda-forge

    Write-Host('change the priority of defaults, the highest priority')
    conda config --prepend channels defaults

    Write-Host('prioritize channels, strict to speed up conda and for consistency')
    conda config --set channel_priority $priority
    
    Write-Host('set proxy for conda, no pwd required')
    conda config --set proxy_servers.http $proxy
    conda config --set proxy_servers.https $proxy
            
    Write-Host('disabling ssl verify')
    conda config --set ssl_verify False
    
    # pip interoperability, conda can use pip-installed packages to satisfy dependencies, cleanly remove pip-installed Write-Host('software, and replace them with conda packages when appropriate')
    # It may slow down conda'
    conda config --set pip_interop_enabled True 

}elseif($component -eq "git-conda") 
{ 
    Write-Output "Configuring GIT and CONDA"
    Write-Host('change the priority of conda-forge, the lowest priority')
    conda config --append channels conda-forge

    Write-Host('change the priority of defaults, the highest priority')
    conda config --prepend channels defaults

    Write-Host('prioritize channels, strict to speed up conda and for consistency')
    conda config --set channel_priority $priority
    
    Write-Host('set proxy for conda, no pwd required')
    conda config --set proxy_servers.http $proxy
    conda config --set proxy_servers.https $proxy
            
    Write-Host('disabling ssl verify')
    conda config --set ssl_verify False
    
    # pip interoperability, conda can use pip-installed packages to satisfy dependencies, cleanly remove pip-installed Write-Host('software, and replace them with conda packages when appropriate')
    # It may slow down conda'
    conda config --set pip_interop_enabled True 

    Write-Host('set up proxy for GIT')
    git config --global http.proxy $proxy
}elseif($component -eq "git-pip") 
{ 
    Write-Output "Configuring GIT and PIP"
    Write-Host('set proxy for pip, no pwd required')
    pip config set global.proxy $proxy
            
    Write-Host('set the pip trusted channels')
    pip config set global.trusted-host pypi.python.org
    pip config set global.trusted-host pypi.org
    pip config set global.trusted-host files.pythonhosted.org

    Write-Host('set up proxy for GIT')
    git config --global http.proxy $proxy
}elseif($component -eq "conda-pip") 
{ 
    Write-Output "Configuring CONDA and PIP"
    Write-Host('change the priority of conda-forge, the lowest priority')
    conda config --append channels conda-forge

    Write-Host('change the priority of defaults, the highest priority')
    conda config --prepend channels defaults

    Write-Host('prioritize channels, strict to speed up conda and for consistency')
    conda config --set channel_priority $priority
    
    Write-Host('set proxy for conda, no pwd required')
    conda config --set proxy_servers.http $proxy
    conda config --set proxy_servers.https $proxy
            
    Write-Host('disabling ssl verify')
    conda config --set ssl_verify False
    
    # pip interoperability, conda can use pip-installed packages to satisfy dependencies, cleanly remove pip-installed Write-Host('software, and replace them with conda packages when appropriate')
    # It may slow down conda'
    conda config --set pip_interop_enabled True 
            
    Write-Host('set proxy for pip, no pwd required')
    pip config set global.proxy $proxy
            
    Write-Host('set the pip trusted channels')
    pip config set global.trusted-host pypi.python.org
    pip config set global.trusted-host pypi.org
    pip config set global.trusted-host files.pythonhosted.org

}else{
  Write-Output "first argument should be either all, conda, pip, git, git-conda, git-pip, conda-pip"
}



