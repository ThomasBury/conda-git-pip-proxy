<img src="bender_hex_mini.png" style="position:absolute;top:0px;right:0px;" width="120px" align="right" />

# Set up the proxy for conda, pip and R

This short wiki describes how to set up the proxy using a .condarc file. Once set, then you can install a package as usual without specifying the [proxy-address]:[port] each time.

This wiki is based on the [conda doc](http://conda.io/docs/user-guide/configuration/use-winxp-with-proxy.html) 

# 1 - Conda and proxy setting
You can perform step 1, 2 and 3 manually or using command lines. For the latter, you don't need to complete step 1 and 3, just use the command lines in step 2.

## Step 1 - Create the .condarc file
Using the notepad/notepad++, create a .condarc file (sample file available here: [.condarc template](https://conda.io/docs/user-guide/configuration/sample-condarc.html)) and save it as `.condarc` or just download the provided one

## Step 2 - Copy paste the proxy config
### without authentification
You just need to copy-paste those lines in the `.condarc` file (use notepad++ to edit the file)

```
proxy_servers:
  http: [proxy-address]:[port]
  https: [proxy-address]:[port]

ssl_verify: False
```
Using **Fiddler**: the proxy address is then `https://localhost:8888`


**Note that you can go command line all the way using:**
 * `conda config --set proxy_servers.http [proxy-address]:[port]` 
 * `conda config --set proxy_servers.https [proxy-address]:[port]` 
 * `conda config --set ssl_verify False`
 
 and check it using `conda config --show`

### with authentification
If you need authentification you can use

```
proxy_servers:
  http: http://[login]:[pwd]@[proxy-address]:[port]
  https: https://[login]:[pwd]@[proxy-address]:[port]

ssl_verify: path to corp.crt
```

**Note that you can go command line all the way using:**
 * `conda config --set proxy_servers.http [login]:[pwd]@[proxy-address]:[port]` 
 * `conda config --set proxy_servers.https [login]:[pwd]@[proxy-address]:[port]` 
 * `conda config --set ssl_verify False`

## Step 3 - Put the file in the Anaconda directory (not needed if you used command line)

Last, move the `.condarc` file in the Anaconda directory (usually `C:\Anaconda`) 

## Step 4 - See if it works

- Close all the notebooks tabs and the conda prompts, 
- Open a new conda/anaconda prompt as Admin (right click, run as Admin) 
- Type the following command `conda update conda` or `conda install -c pyviz pyviz` 
- Type: `pip install palettable`

If files are downloaded and installed, then it works !

## Optional 1 - Going pirate

You can also disable SSL authentification	`conda config --set ssl_verify False`. Sometines, the ssl authentification is not working because of depreciated security, proxy and OS. In that case, turn off the ssl verify and 

## Optional 2 - Add rules to firewall
The following might not be required. Just perform the conda and pip config, check if both conda install and pip install are working. If not try to add 2 rules (for `python.exe` for `pythonw.exe` found in the Anaconda folder)

 - Go to `Windows Firewall with Advanced Security`
 - Indound rules > new rule > progran > next > browse > `C:\Anaconda\python.exe`
 - Indound rules > new rule > progran > next > browse > `C:\Anaconda\pythonw.exe`

# 2 - Pip install through a proxy

## no setting

At each pip install replace the command `pip install <pckg_name>` by `pip -- [proxy-address]:[port] install <pckg_name>`
If you need to set env variable, in a command prompt as admin, type `set HTTP_PROXY=[proxy-address]:[port]` and `set HTTPS_PROXY=[proxy-address]:[port]`

## Managing pip.ini with proxy or Fiddler installed

Find where the pip folder is: use the command 

```bash
(base) C:\WINDOWS\system32>pip config list -v
```
the output should be something like:

```bash
For variant 'global', will try loading 'C:\ProgramData\pip\pip.ini'
For variant 'user', will try loading 'C:\Users\[login]\pip\pip.ini'
For variant 'user', will try loading 'C:\Users\[login]\AppData\Roaming\pip\pip.ini'
```
You may have to create the pip folder. Copy paste those lines into the pip.ini (create it with notepad++ or notepad)

```
    [global]
    trusted-host = pypi.python.org
                   pypi.org
                   files.pythonhosted.org
    proxy = https://localhost:8888 
```

**Instead of doing it manually, you can create and edit the `pip.ini` using the following commands:**

```bash
pip config set global.proxy http://[proxy-address]:[port]
pip config set global.trusted-host pypi.python.org
pip config set global.trusted-host pypi.org
pip config set global.trusted-host files.pythonhosted.org
```


Or you can specify the trusted host if you don't want to set up a pip config (but not convenient)
`pip install --trusted-host files.pythonhosted.org --trusted-host pypi.org --trusted-host pypi.python.org <pkg_name>`

## Managing pip.ini without Fiddler installed

If you need authentification (** this should not be necessary if you use fiddler or if IT set up your windows image correctly **), then
```
    [global]
    trusted-host = pypi.python.org
                   pypi.org
                   files.pythonhosted.org
    proxy = https://[login]:[pwd]@[proxy-address]:[port]
    cert  = path to \cacert.pem
```

Or via command line:

```bash
pip config set global.proxy https://[login]:[pwd]@[proxy-address]:[port]
```


# 3 - R

## Using httr

If not working, see next solution

```r
library(httr)
set_config(use_proxy(url = "[proxy-address]:[port]"))
require(devtools)
install_github("repo_path")
```

## Editing environment variables in .Renviron

if httr does not work, you can also hard code the environment variable by doing:

* `file.edit('~/.Renviron')` in the R console
* In the .Renviron file, copy paste  http_proxy=http://[login]:[pwd]@[proxy-address]:[port]
   https_proxy=http://[login]:[pwd]@[proxy-address]:[port]   (the http**S** is not supported yet)
* Restart R and Rstudio

## Test your access

You can test your access by running:

```r
library(rvest)

# Store web url
commando_movie <- read_html("https://www.imdb.com/title/tt0088944/?ref_=nm_flmg_act_58")

#Scrape the website for the movie rating
rating <- commando_movie %>% 
    html_nodes("strong span") %>%
    html_text() %>%
    as.numeric()
rating # this should be set to >=10 :D
```
