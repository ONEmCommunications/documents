## Pre requisites
In order to be able to run a Python application for ONEm on your machine please make sure
you have installed the following:

- Python (v3.7 or above)
- git
- ngrok
- optionally, an IDE that supports Python language if you want to edit the source code

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

### Install python >= 3.7

Developing a ONEm application requires at least python 3.7. Not to mess up with your 
other projects that might need a different python version, we suggest using pyenv.

#### Install Python dependencies:

Before you install pyenv itself, you need to install some dependencies that are required 
because pyenv installs Python by building from source.
Here's what you need to do.

- Debian, Ubuntu, Deepin, LinuxMint:

        $ sudo apt-get update
        $ sudo apt-get upgrade
        $ sudo apt-get dist-upgrade
        $ sudo apt-get install build-essential checkinstall python-dev \
                               python-setuptools python-pip python-smbus
        $ sudo apt-get install libncursesw5-dev libgdbm-dev libc6-dev
        $ sudo apt-get install zlib1g-dev libsqlite3-dev tk-dev
        $ sudo apt-get install libssl-dev openssl

- Centos, Fedora:

        $ sudo yum install zlib-devel bzip2 bzip2-devel readline-devel sqlite \
                           sqlite-devel openssl-devel xz xz-devel libffi-devel

- Mac OS:

        $ brew install openssl readline sqlite3 xz zlib

    When running Mojave you will also need to install the additional SDK headers:

        $ xcode-select --install

    You'll then receive:

        $ xcode-select: note: install requested for command line developer tools

    and be prompted in a window to update Xcode Command Line tools. After the update is 
    completed, open a new terminal window and type:

        $ sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /

#### Install `pyenv`:

- Debian, Ubuntu, Deepin, LinuxMint, CentOS, Fedora:

        $ curl https://pyenv.run | bash

    Restart your shell so the path changes take effect. See [pyenv-installer](https://github.com/pyenv/pyenv-installer) 
    for more info.

- Mac OS:

        $ brew install pyenv

    Add pyenv initializer to shell startup script

        $ echo 'eval "$(pyenv init -)"' >> ~/.bash_profile

    Reload your profile

        $ source ~/.bash_profile

- Windows:

    Please note that `pyenv` is not currently supported on Windows.
    
    If you do want to use a Python version manager for Windows, you can give it a
    try to [pyenv-win](https://pypi.org/project/pyenv-win/).

#### Install `python 3.7` or above using `pyenv`
  
Example:

    $ pyenv install 3.7.0

<!-- $ SDKROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk pyenv install 3.7.0 -->

#### Install `pipenv` for an easier virtual environment management

- Debian, Ubuntu, Deepin, LinuxMint, CentOS, Fedora:

        $ sudo pip install pipenv

- Mac OS:

        $ brew install pipenv

    or use:
    
        $ pip install pipenv --user python

- Windows:

    Download the latest Python version available for Windows from 
    [official website](https://www.python.org/downloads/windows/). Run the 
    installer and make sure to check the box that says **Add Python 3.x to PATH** 
    to ensure that the interpreter will be placed in the execution path.
    Then click **Install Now** and that should be all.

### Install ngrok

Please download and install `ngrok` as described on [the official website](https://ngrok.com/download).

### Install an IDE

If you don't already have a preferred IDE, there is plenty you can choose from. Here is a
list of IDEs in no particular order:

- [Pycharm](https://www.jetbrains.com/pycharm/download/#section=linux) - Community or Professional
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
