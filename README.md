[EasyEngine] (https://github.com/rtCamp/easyengine)-[Vagrant](https://vagrantup.com/)
==================

This is a simple Vagrant file to test  EasyEngine on your any system using Vagrant.

Note: If you are using other that Ubuntu/Debian system, then installation steps will differ, but setup steps are same.


## Installation
1. First we will install Virtual Box and Vagrant on our system.

  ```bash
  sudo apt-get install virtualbox
  ```
1.  After that download the latest version of Vagrant from http://www.vagrantup.com/downloads
2.  Install vagrant

  ```bash
   sudo dpkg -i vagrant_*.deb
  ```
2.  You will also need to install [vagrant-hostsupdater](https://vagrantup.com/) plugin for Vagrant

  ```bash
    sudo vagrant plugin install vagrant-hostsupdater
  ```

## Let's setup Vagrant
1. You can use any distribution from [VagrantCloud](http://vagrantcloud.com/) that supports EasyEngine. By default EasyEngine-Vagrant uses ubuntu/trusty64. 
  To change the distribution open the Vagrantfile and replace ubutnu/trusty64 with box name

  ```bash
  git clone git@github.com:rtCamp/easyengine-vagrant.git

  cd easyengine-vagrant
 ```
2. Edit `ee-hosts` file and enter domain names that should be pointed to this vagrant box

  ```
      $ cat ee-hosts
      example.com
  ```

3. Now start Vagrant

  ```bash
  vagrant up
  ```
4. It will setup EasyEngine on Vagrant Box. 

  ```
    ee site create example.com --wp
  ```

5. To check installation log, open another terminal and use

  ```bash
  tail -f easyengine-vagrant/logs/*
  ```