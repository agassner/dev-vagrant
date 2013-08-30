# Overview

This project provides a mechanism to automate several tasks to be able to set up a Vagrant VM.

## Requirements

* VirtualBox
    - Download it from http://www.virtualbox.org/ (version 4.2+)

* Vagrant
    - Download it from http://www.vagrantup.com (version 1.2 or higher)
    - Required plugins: vagrant-berkshelf, vagrant-omnibus and vagrant-vbguest (Installed via `make`)

* Ruby 1.9.3

## Installation/Provision

```
git clone https://github.com/agassner/dev-vagrant.git
cd dev-vagrant
make install_vagrant_plugins
vagrant up
...
vagrant ssh
cd /vagrant
make
```