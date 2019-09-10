# Python prerequisites
In order to be able to run a Python application for ONEm on your machine please make sure
you have installed the following:

- Python (v3.7 or above)
- git
- ngrok
- optionally, an IDE that supports Python language if you want to edit the source code

### Install git
Run the following command in your terminal

- Debian: 

        $ sudo apt-get install git

- Centos: 

        $ sudo yum install git

- Mac OS:

        $ brew install git

### Install python >= 3.7

Developing a ONEm application requires at least python 3.7. Not to mess up with your 
other projects that might need a different python version, we suggest using pyenv.

#### Install Python dependencies:

Before you install pyenv itself, you need to install some dependencies that are required 
because pyenv installs Python by building from source.
Here's what you need to do.

- Debian:

        $ sudo apt-get update
        $ sudo apt-get upgrade
        $ sudo apt-get dist-upgrade
        $ sudo apt-get install build-essential checkinstall python-dev \
                               python-setuptools python-pip python-smbus
        $ sudo apt-get install libncursesw5-dev libgdbm-dev libc6-dev
        $ sudo apt-get install zlib1g-dev libsqlite3-dev tk-dev
        $ sudo apt-get install libssl-dev openssl

- Centos:

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

- Debian

        $ curl https://pyenv.run | bash

    Restart your shell so the path changes take effect. See [pyenv-installer](https://github.com/pyenv/pyenv-installer) 
    for more info.

- Mac os:

        $ brew install pyenv

    Add pyenv initializer to shell startup script

        $ echo 'eval "$(pyenv init -)"' >> ~/.bash_profile

    Reload your profile

        $ source ~/.bash_profile

#### Install `python 3.7` or above using `pyenv`
  
Example:

    $ pyenv install 3.7.0

<!-- $ SDKROOT=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk pyenv install 3.7.0 -->

#### Install `virtualenvwrapper` for an easier virtual environment management

Follow the instructions [here](https://virtualenvwrapper.readthedocs.io/en/latest/install.html)

### Install ngrok

If you are planning to run the application on your local machine, please download and install `ngrok` as described on [the official website](https://ngrok.com/download).

### Install an IDE

If you don't already have a preferred IDE, there is plenty you can choose from. Here is a
list of IDEs in no particular order:

- [Pycharm](https://www.jetbrains.com/pycharm/download/#section=linux) - Community or Professional
- [Atom](https://atom.io/) - free and open source
- [Visual Studio Code](https://code.visualstudio.com/) - free and open source
- etc
