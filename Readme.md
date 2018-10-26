<img src="bender_hex_mini.png" style="position:absolute;top:0px;right:0px;" width="120px" align="right" />

# Set up the proxy for conda install 

This short wiki describes how to set up the proxy using a .condarc file. Once set, then you can install a package as usual without specifying the [proxy-address]:[port] each time.

This wiki is based on the [conda doc](http://conda.io/docs/user-guide/configuration/use-winxp-with-proxy.html) 

## Step 1 - Create the .condarc file
Using the notepad/notepad++, create a .condarc file (sample file available here: [.condarc template](https://conda.io/docs/user-guide/configuration/sample-condarc.html)) and save it as `.condarc` or just download the provided one

## Step 2 - Copy paste the proxy config

You just need to copy-paste those lines in the `.condarc` file (use notepad++ to edit the file)

```
proxy_servers:
  http: [proxy-address]:[port]
  https: [proxy-address]:[port]

ssl_verify: False
```

## Step 3 - Put the file in the Anaconda directory

Last, move the `.condarc` file in the Anaconda directory (usually `C:\Anaconda`) 

## Step 4 - Add rules to firewall

Add 2 rules (for `python.exe` for `pythonw.exe` found in the Anaconda folder)

 - Go to `Windows Firewall with Advanced Security`
 - Indound rules > new rule > progran > next > browse > `C:\Anaconda\python.exe`
 - Indound rules > new rule > progran > next > browse > `C:\Anaconda\pythonw.exe`

## Step 5 - See if it works

- Close all the notebooks tabs and the conda prompts, 
- Open a new conda/anaconda prompt as Admin (right click, run as Admin) 
- Type the following command `conda update conda` or `conda install -c pyviz pyviz` 

If files are downloaded and installed, then it works !


# Pip install through a proxy
## no setting

At each pip install replace the command `pip install <pckg_name>` by `pip -- [proxy-address]:[port] install <pckg_name>`

## Setting the proxy as windows system variable

in a command prompt as admin type `set HTTP_PROXY=[proxy-address]:[port]` and `set HTTPS_PROXY=[proxy-address]:[port]`

## Managing pip.ini

Find where the pip folder is (usually in `%APPDATA%\pip\` on windows plateform)
Create a pip.ini file in the pip folder and copy paste those lines:

```
    [global]
    trusted-host = pypi.python.org
                   pypi.org
                   files.pythonhosted.org
    proxy = [proxy-address]:[port]
```


# R

```r
library(httr)
set_config(use_proxy(url = "[proxy-address]:[port]"))
require(devtools)
install_github("repo_path")
```
