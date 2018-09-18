# Set up the proxy for conda install 
This short wiki describes how to set up the proxy using a .condarc file. Once set, then you can install a package as usual without specifying the it000-surf.zone2.proxy.allianz:8080 proxy.

This wiki is based on the [conda doc](http://conda.io/docs/user-guide/configuration/use-winxp-with-proxy.html) 

## Step 1 - Create the .condarc file
Using the notepad/notepad++, create a .condarc file (sample file available here: [.condarc template](https://conda.io/docs/user-guide/configuration/sample-condarc.html)) and save it as `.conda` or just download the provided one

## Step 2 - Copy paste the proxy config

You just need to copy-paste those lines in the `.conda` file (use notepad++ to edit the file)

```
proxy_servers:
  http: it000-surf.zone2.proxy.allianz:8080
  https: it000-surf.zone2.proxy.allianz:8080

ssl_verify: False
```

## Step 3 - Put the file in the Anaconda directory

Last, move the `.conda` file in the Anaconda directory (usually `C:\Anaconda`) 

## Step 4 - Add rules to firewall

I don't know if this step is really necessary but you can add 2 rules (for `python.exe` for `pythonw.exe` found in the Anaconda folder)

 - Go to `Windows Firewall with Advanced Security`
 - Indound rules > new rule > progran > next > browse > `C:\Anaconda\python.exe`
 - Indound rules > new rule > progran > next > browse > `C:\Anaconda\pythonw.exe`

## Step 5 - See if it works

- Close all the notebooks tabs and the conda prompts, 
- Open a new conda/anaconda prompt as Admin (right click, run as Admin) 
- Type the following command `conda update conda` or `conda install -c pyviz pyviz` 

If files are downloaded and installed, then it works !
