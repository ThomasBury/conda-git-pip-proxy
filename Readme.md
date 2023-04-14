![Avatar](bender_hex_mini.png)

# Automation of conda, pip and git set up

Dealing with a proxy and a firewall can be an arduous task for users. The objective of this concise PowerShell script is to simplify the process of configuring conda, pip, and git to work effectively within your company's framework. It's worth noting that you have the option of selecting one, two, or all three components as needed, as outlined below. Once configured, the solution provided will allow you to effortlessly create python environments, install packages, and interact with GitHub (Enterprise or otherwise).


# 1 - How to use

## 1.1 Powershell
This assumes that you have a recent Anaconda/Miniconda/Mambaforge distribution if you want to configure conda. If not, you can download it from [there](https://www.anaconda.com/products/individual) (scroll down) and install it as admin. For GIT and PIP, you don't need Anaconda.

 - save the `cpg-config.ps1` script in a folder of your choice
 - open a `Windows powershell` (or an `anaconda powershell` if you have one), ideally as `admin` (right click --> run as admin)
 - navigate to the folder where you saved the script: `cd c:\user\folder_name`
 - use this command line: `.\cpg-config.ps1 [proxy_address]` then enter
 - Done!

**Digitally signed error while running a powershell script**

When you run a .ps1 PowerShell script you might get the message saying *XXX.ps1 is not digitally signed. The script will not execute on the system.* In a powershell prompt, run the command (you might need admin rights):

```shell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

**Using conda in a Windows PowerShell**

Chances are that the Windows PowerShell will not recognize the command `conda`. If you have anaconda install, this is easy to solve:

 - open a `anaconda powershell`
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