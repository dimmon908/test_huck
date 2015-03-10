# encoding: utf-8
# This file originally created at http://rove.io/09917dbf5090c5c1f6a64d1e291e3749

# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # config.vm.box = "opscode-ubuntu-12.04_chef-11.4.0"
  # config.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_chef-11.4.0.box"

  config.vm.box = "ubuntu/trusty64"
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  config.ssh.forward_agent = true
  config.vm.network :forwarded_port, guest: 3000, host: 3000

  config.vm.synced_folder "./", "/var/www/hackature"

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]

    chef.add_recipe 'apt'
    chef.add_recipe 'nodejs'
    chef.add_recipe 'ruby_build'
    chef.add_recipe 'rbenv::user'
    chef.add_recipe 'rbenv::vagrant'
    chef.add_recipe 'vim'
    chef.add_recipe 'mysql::server'
    chef.add_recipe 'mysql::client'
    chef.add_recipe 'git'
    chef.add_recipe 'nginx'
    chef.json = {
      :vagrant => {
        :system_chef_solo => '/usr/bin/chef-solo'
      },
      rbenv: {
        user_installs: [{
                          user: 'vagrant',
                          rubies: ["2.1.2"],
                          global: "2.1.2",
                          gems: {
                            "2.1.2" => [
                              { name: "bundler" }
                            ]
                          }
                        }]
      },
      :git   => {
        :prefix => "/usr/local"
      },
      :vim   => {
        :extra_packages => [
          "vim-rails"
        ]
      },
      :mysql => {
        :server_root_password   => "root",
        :server_repl_password   => "root",
        :server_debian_password => "root",
        :service_name           => "mysql",
        :basedir                => "/usr",
        :data_dir               => "/var/lib/mysql",
        :root_group             => "root",
        :mysqladmin_bin         => "/usr/bin/mysqladmin",
        :mysql_bin              => "/usr/bin/mysql",
        :conf_dir               => "/etc/mysql",
        :confd_dir              => "/etc/mysql/conf.d",
        :socket                 => "/var/run/mysqld/mysqld.sock",
        :pid_file               => "/var/run/mysqld/mysqld.pid",
        :grants_path            => "/etc/mysql/grants.sql"
      },
      :nginx => {
        :dir                => "/etc/nginx",
        :log_dir            => "/var/log/nginx",
        :binary             => "/usr/sbin/nginx",
        :user               => "www-data",
        :init_style         => "runit",
        :pid                => "/var/run/nginx.pid",
        :worker_connections => "1024"
      }
    }
  end
end
