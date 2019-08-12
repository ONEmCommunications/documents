## Pre requisites
In order to be able to run a NodeJS application for ONEm on your machine please make sure
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

### Install python >= 3.7
- Install Python dependencies:
    - Debian

            $ sudo apt-get update
            $ sudo apt-get upgrade
            $ sudo apt-get dist-upgrade
            $ sudo apt-get install build-essential checkinstall python-dev python-setuptools python-pip python-smbus
            $ sudo apt-get install libncursesw5-dev libgdbm-dev libc6-dev
            $ sudo apt-get install zlib1g-dev libsqlite3-dev tk-dev
            $ sudo apt-get install libssl-dev openssl
            $ sudo apt-get install libffi-dev
  
- Install `pyenv`: 

        $ curl https://pyenv.run | bash

- Restart your shell so the path changes take effect. See 
[pyenv-installer](https://github.com/pyenv/pyenv-installer) for more info.
- Install `python 3.7` or above using `pyenv`. Example:

        $ pyenv install 3.7.0

- Install `pipenv` for an easier virtual environment management

        $ sudo pip install pipenv

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
