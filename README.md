# Salt-Config

This repository contains the SaltStack configuration for all environments and
services used in ESC.

It also contains a working Vagrant configuration (directory `vagrant`), which
you can use to initialize a virtual machine to test applications in an isolated
environment. You can also use that to avoid polluting your OS with tons
packages and config required to run some application.


## Using This Vagrant Config

To boot up a Vagrant-managed virtual machine, simply do the following:

1. Install Vagrant (and VirtualBox)
2. Download this repository
3. Navigate into this repository's `vagrant` directory
4. Drop your keys there (the ones the admin gave you)
5. Set up your minion file (see below)
6. Run `vagrant up`
7. Go to localhost:10080 and check that the app is running (see below below)

So by step 6, you should have the following files in `salt-config/vagrant`:

* `Vagrantfile`: main Vagrant virtual box configuration
* `minion`: configuration for the minion
* `key.pem`: private key (for communication with the Salt Master)
* `key.pub`: public key (for communication with the Salt Master)

If you're missing any of those, review the steps above again.


### Minion File Configuration

When provisioning a virtual box, Vagrant will look for the Minion configuration 
in a file named `minion` (option `salt.minion_config` in the `Vagrantfile`), 
which you need to create from scratch. Just kidding: copy the `minion.example`
as `minion`, set your minion **id** in there (which the admin gave you with the 
keys) and you're done.

Really, there's no point in changing anything right now because we have a
single app. Well, you **could** change the *env* to *demo* if you wanted to use
the demo database hosted in AWS instead of a local SQLite...


### Host-Guest Communication

When running Vagrant, your guest (virtual machine) will not be isolated from your
host (real machine): Vagrant can (and will) forward a few ports and synchronize
filesystem directories.

The ones done by Vagrant automatically:

* host :2222 -> guest :22 (SSH)
* host current dir -> /vagrant

The ones added by our configuration (the `Vagrantfile`):

* host :10080 -> guest :80 (HTTP)
* host two levels above current dir -> /home/vagrant/apps

You can also ssh into the guest machine by running:

    vagrant ssh



### Highstate

The option `salt.run_highstate` in the `Vagrantfile` instructs vagrant to 
communicate with the Salt Master and run all the states required for this 
Minion. This will install all the software and execute all the commands
required to have the application up and running. If you don't want this (???),
you can disable it by setting it to `false` or commenting it out.


### Repository Pulling

During the *highstate*, your Minion **will** try to checkout the repository of
the application into your guest's `/home/vagrant/apps`, so that might add a new
repository to your local filesystem (remember that the directories are synchronized!)

However, it's a rather safe operation since it will only checkout if there is
no directory with the same name, or if the directory is the same repository
**and** it's *clean* (ie, it has no uncommitted changes).

As an example to picture it better, imagine I have this filesystem structure:

    /home/kako/dev/projects/
      salt-config/
        vagrant/ > current working directory for vagrant
        ...
      some-repo/
        ...
      another-repo/
        ...
    /home/kako/dev/libs
      ...

In that case, it will pull the repository into `/home/kako/dev/projects`,
because there's no directory there with that name.

But if I have a directory with the same name but it is not the same repository:

    /home/kako/dev/projects/
      salt-config/
        vagrant/ > current working directory for vagrant
        ...
      some-repo/
        ...
      tracker/
        ...

It won't do anything. Which, in turn, will disable all the states that need 
that repository, so the application will not start.


### Other Commands

If you want to stop your box:

    vagrant halt

If you want to kill (remove) your box:

    vagrant destroy