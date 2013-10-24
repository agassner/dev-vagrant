# -*- mode: ruby -*-
# vim: set ft=ruby sw=2 :

Vagrant.configure("2") do |config|
  config.omnibus.chef_version = "11.4.0"

  config.vm.define "dev-vagrant"
  config.vm.box = "precise64"

  config.vm.network :forwarded_port, host: 80, guest: 80
  config.vm.network :forwarded_port, host: 3000, guest: 3000
  config.vm.network :forwarded_port, host: 3030, guest: 3030
  config.vm.network :forwarded_port, host: 8080, guest: 8080
  config.vm.network :forwarded_port, host: 8181, guest: 8181
  config.vm.network :forwarded_port, host: 9000, guest: 9000
  config.vm.network :forwarded_port, host: 27017, guest: 27017
  config.vm.network :forwarded_port, host: 28017, guest: 28017
  config.vm.network :forwarded_port, host: 35729, guest: 35729

  config.vm.provider :virtualbox do |v, override|
    override.vm.box_url = "http://files.vagrantup.com/precise64.box"
    v.customize ["modifyvm", :id, "--memory", "3072"]
    v.customize ["modifyvm", :id, "--cpus", "2"]
  end

  config.vm.synced_folder "#{ENV['HOME']}/workspace", "/home/vagrant/workspace"

  config.berkshelf.enabled = true

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe 'apt::default'
    chef.add_recipe 'git'
    chef.add_recipe 'chef-golang'
    chef.add_recipe 'java::oracle'
    # chef.add_recipe 'java7'
    chef.add_recipe 'nodejs'
    chef.add_recipe 'mongodb::10gen_repo'
    chef.add_recipe 'sqlite'
    chef.add_recipe 'mysql::server'
    chef.add_recipe 'postgresql::server'

    chef.add_recipe 'ruby_build'
    chef.add_recipe 'rbenv::user'
    chef.add_recipe 'rbenv-alias'
    chef.add_recipe 'rbenv-sudo'

    chef.json = {
      'java' => {
        'jdk_version' => '7',
        'oracle' => {
          'accept_oracle_download_terms' => 'true'
        }
      },
      'nodejs' => {
        'version' => '0.10.15'
      },
      'rbenv' => {
        'user_installs' => [ {
          'user' => 'vagrant',
          'global' => '2.0.0-p247',
          'rubies' => [ '2.0.0-p247' ],
          'gems' => {
            '2.0.0-p247' => [
              { 'name' => 'bundler' }
            ]
          },
        } ]
      },
      'rbenv-alias' => {
        'user_rubies' => [ {
          'user' => 'vagrant',
          'installed' => '2.0.0-p247',
          'alias' => '2.0.0'
        } ]
      },
      'mysql' => {
        'server_root_password' => '',
        'server_repl_password' => '',
        'server_debian_password' => ''
      },
      'postgresql' => {
        'password' => {
          'postgres' => ''
        }
      }
    }
  end
end
