## Pre requisites
In order to be able to run a NodeJS application for ONEm on your machine please make sure
you have installed the following:

- NodeJS (v8.0.0 or above)
- git
- ngrok
- optionally, an IDE that supports JavaScript language if you want to edit the source code

### Install git
Run the following command in your terminal

- Debian, Ubuntu, Deepin, LinuxMint:

        $ sudo apt-get install git

- Centos, Fedora:

        $ sudo yum install git

- Mac OS:

        $ brew install git

- Windows:

    There are a few ways to install Git on Windows.

    The official build is available on the Git website; go to 
    [git-scm.com/download/win](https://git-scm.com/download/win) and the download 
    will start automatically. Run the setup and follow the instructions.

    If you use **Chocolatey** manager on Windows, then you can install the git 
    package as instructed [here](https://chocolatey.org/packages/git). Note that the
    **Chocolatey** package is community maintained.

### Install NodeJS

We will use `nvm` to easily install any version of NodeJS. You can install it directly on
your machine following the [official page](https://nodejs.org/en/download/).

#### Install `nvm`:

- Debian, Ubuntu, Deepin, LinuxMint, CentOS, Fedora, Mac OS:

    Please follow the nvm installing steps as provided by 
    [nvm repo](https://github.com/nvm-sh/nvm#install--update-script).

- Windows:

    Please note that `nvm` does not support Windows. If you want to use a version
    manager for Windows, you can give it a try to 
    [nvm-windows](https://github.com/coreybutler/nvm-windows) or 
    [nodist](https://github.com/nullivex/nodist).

    If you use **Chocolatey** manager on Windows, then you can also use the `nvm` 
    package as instructed [here](https://chocolatey.org/packages/nvm).

#### Install Node >= 8.1.x

- Debian, Ubuntu, Deepin, LinuxMint, CentOS, Fedora, Mac OS:

    Example:

        $ nvm install 10

    Please note that `nvm install node` will install the latest Node version.

- Windows:
    
    Download the latest Node version available for your Windows from 
    [official website](https://nodejs.org/en/download/). Run the installer following 
    the steps and that should be all.

### Install ngrok
Please download and install `ngrok` as described on [the official website](https://ngrok.com/download).

### Install an IDE
If you don't already have a preferred IDE, there is plenty you can choose from. Here is a
list of IDEs in no particular order:

- [Webstorm](https://www.jetbrains.com/webstorm/) - 30 days free trial
- [Atom](https://atom.io/) - free and open source
- [Visual Studio Code](https://code.visualstudio.com/) - free and open source
- etc

## Run an existing application
<!-- to be detailed -->

### Download source code
<!-- to be detailed -->

### Install dependencies
<!-- to be detailed -->

### Start the server
<!-- to be detailed -->

### Expose your server publicly
<!-- to be detailed -->

#### Run ngrok
<!-- to be detailed -->

#### Obtain callback URL
<!-- to be detailed -->


## Access the applications
<!-- to be detailed -->

### Register the application
<!-- to be detailed -->

### Access simulator
<!-- to be detailed -->


## Tweak the application
<!-- to be detailed -->

### Redeploy
<!-- to be detailed -->
