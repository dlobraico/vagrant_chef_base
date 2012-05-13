#
# Cookbook Name:: dev
# Recipe:: default
#
# Author:: Dominick LoBraico <djlobraico.com>
# Copyright 2012 
#
# All rights reserved - Do Not Redistribute
#
# Installs some basic packages used for development.
package("htop")

git "/home/vagrant/dotfiles" do
    repository "git://github.com/pygatea/dotfiles.git"
    reference "master"
    action :sync
end

execute "bootstrap_starter" do
    user "vagrant"
    cwd "/home/vagrant/dotfiles"
    command "./bootstrap_starter.sh"
    action :run
    environment ({'HOME' => '/home/vagrant'})
end

execute "change default shell" do
    user "vagrant"
    command "sudo chsh -s /bin/zsh vagrant"
    action :run
end
