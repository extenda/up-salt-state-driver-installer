require 'serverspec'

set :os, :family => 'linux'
set :host, '127.0.0.1'
set :backend, :ssh
set :ssh_options,
    :user => 'vagrant',
    :password => 'vagrant',
    :port => '2200',
    #:port => '2222',
    :verify_host_key => false
set :request_pty, true
