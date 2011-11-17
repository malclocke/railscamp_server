Railscamp Server
----------------

This repo contains Puppet configuration to run a server for a RailsCamp.  It
also includes configuration for setting up vagrant to run a VM to test the
puppet config.

Getting up and running
----------------------

    $ gem install vagrant
    $ vagrant box add puppet-squeeze-64 http://puppetlabs.s3.amazonaws.com/pub/squeeze64.box
    $ vagrant init puppet-squeeze-64
    $ vagrant up

