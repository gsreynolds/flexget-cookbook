#
# Cookbook Name:: flexget
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

include_recipe "python::default"

python_pip "flexget"
python_pip "transmissionrpc" if node['flexget']['use_transmissionrpc']
