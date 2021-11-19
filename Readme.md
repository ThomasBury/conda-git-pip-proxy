![Avatar](bender_hex_mini.png)

# Automation of conda, pip and git set up

Working behind a proxy and a firewall can be a frustrating user experience. The goal of this small (minimal) PowerShell/Batch script is to automate the setting of conda, pip and git such that they work fine in your company framework. Note that you can set up only one, two or three of those components, see below.
Note that the provided solution works fine, will allow you to create python environments, install packages and interact with GitHub (Enterprise or not) seamlessly.


# 1 - How to use

## 1.1 Command Prompt

If you don't have the rights to run powerscript shell, you can use the batch version of the script as below. This assumes that you have a recent Anaconda distribution if you want to configure conda. If not, you can download it from [there](https://www.anaconda.com/products/individual) (scroll down) and install it as admin. For setting up the proxy for GIT and PIP, you don't need Anaconda.

If you prefer using PowerShell, please see the next section. For setting conda, the best is to use the `Anaconda CMD` as admin.

 - save the `cpg-config.bat` script in a folder of your choice
 - open an `Command Prompt`, ideally as `admin` (right click --> run as admin). It is equivalent to do it with `Anaconda CMD`, not mandatory though.
 - navigate to the folder where you saved the script: `cd c:\user\folder_name`
 - use this command line: `cpg-config.bat [proxy_url] all flexible` then enter. Just replace `[proxy_url]` by your proxy url (e.g. https://xyz.proxy.company-name:8080) 
 - Done!

**REM:** Options
 - `cpg-config.bat [proxy_url] git flexible` will configure only GIT
 - `cpg-config.bat [proxy_url] conda flexible` will configure only CONDA
 - `cpg-config.bat [proxy_url] pip flexible` will configure only pip
 - `cpg-config.bat [proxy_url] conda-git flexible` will configure CONDA+GIT
 - `cpg-config.bat [proxy_url] conda-pip flexible` will configure CONDA+PIP
 - `cpg-config.bat [proxy_url] git-pip flexible` will configure GIT+PIP

 You can replace `flexible` by `strict` if you want a strict channel order for conda (it speeds up conda but will always look for the packages in the defined order).

## 1.2 Powershell
This assumes that you have a recent Anaconda distribution if you want to configure conda. If not, you can download it from [there](https://www.anaconda.com/products/individual) (scroll down) and install it as admin. For GIT and PIP, you don't need Anaconda.

 - save the `cpg-config.ps1` script in a folder of your choice
 - open an `Windows powershell` (or an `anaconda powershell` if you have one), ideally as `admin` (right click --> run as admin)
 - navigate to the folder where you saved the script: `cd c:\user\folder_name`
 - use this command line: `.\cpg-config.ps1 [proxy_address]` then enter
 - Done!

**Digitally signed error while running a powershell script**

When you run a .ps1 PowerShell script you might get the message saying *XXX.ps1 is not digitally signed. The script will not execute on the system.* In a powershell prompt, ran with admin rights, run the command:

```shell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

**Using conda in a Windows PowerShell**

Chances are that the Windows PowerShell will not recognize the command `conda`. If you have anaconda install, this is easy to solve:

 - open an `anaconda powershell`
 - use the command line `conda init powershell`, it will automatically add conda to path
 - restart your `windows powershell` which will then able to run conda commands



**REM:** Options

You can decide wether you want to configure all, conda, pip, git, git-conda, git-pip, conda-pip by using the optional argument

```shell
.\cpg-config.ps1 [proxy_address] 'all'
```

or only git

```shell
.\cpg-config.ps1 [proxy_address] 'git'
```

or any of the combinations above.

You can also use the optional argument:

 - `.\cpg-config.ps1 [proxy_address] 'conda' 'strict'`

 for setting the channel priority to strict (default is currently `flexible`). As of version 4.6.0, Conda has a strict channel priority feature. Strict channel priority can dramatically speed up conda operations and also reduce package incompatibility problems. We recommend it as a default. However, it may break old environment files, so we plan to delay making it conda's out-of-the-box default until the next major version bump, conda 5.0


## 1.3 - Powershell and CMD are not working, what should I do?

Open a `Anaconda CMD Prompt` and copy-paste the different commands listed [here](setup_conda_pip.md). You can select what to configure

# 2 - Scope

 - On the company network (e.g. with elevated rights)
 - On a company laptop with elevated rights, with VPN ON

 Rem:
  - You don't need `fiddler` anymore
  - On super laptops, you can turn off the VPN. If the VPN is off, you need to: 
       *  `conda config --remove-key proxy_servers.http` 
       *  `pip config unset global.proxy`

# 3 - Useful commands

You'll find [here](setup_conda_pip.md) some useful commands for conda, pip and git

# 4 - WTF is conda, channels and python environments ?!

 - The [conda documentation](https://conda.io/projects/conda/en/latest/user-guide/concepts/index.html) is great. If those concepts are new to you, please take a look, it is well explained ^^
 - [A great introduction](https://www.freecodecamp.org/news/why-you-need-python-environments-and-how-to-manage-them-with-conda-85f155f4353c/) to python environment with conda, with illustrations