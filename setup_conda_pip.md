# Manual setting Conda, Pip and GIT

## Conda

For configuring conda, copy paste the below commands.

### Change the priority of conda-forge, the lowest priority

`conda config --append channels conda-forge`

### Change the priority, the highest priority

`conda config --prepend channels defaults`

### Verify the order

`conda config --get channels`

### Set proxy, no pwd required

```shell
conda config --set proxy_servers.http [PROXY_ADDRESS]
conda config --set proxy_servers.https [PROXY_ADDRESS]
```

### Disabling ssl verify

`conda config --set ssl_verify False`


### Pip interoperability
pip interoperability, conda can use pip-installed packages to satisfy dependencies, cleanly remove pip-installed software, and replace them with conda packages when appropriate. It may slow down conda

`conda config --set pip_interop_enabled True`

### prioritize channels, strict to speed up conda and for consistency

This is optional and can be change using "flexible" instead of strict.

`conda config --set channel_priority strict`

## PIP

PIP requires to set up the company proxy and the trusted channels.

### set proxy, no pwd required

`pip config set global.proxy [PROXY_ADDRESS]`

### set the trusted channels

```shell
pip config set global.trusted-host pypi.python.org
pip config set global.trusted-host pypi.org
pip config set global.trusted-host files.pythonhosted.org
```

## GIT

GIT requires to set up the company proxy

### Set the proxy

git config --global http.proxy [PROXY_ADDRESS]