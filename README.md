Unidata Vagrant Tutorial Materials
==================================

Overview
--------

Vagrant is a developer-centric tool for managing and distributing VM environments between developers and/or users.  I believe that it can be very useful to us as an organization, as both a development tool and a distribution pipeline for pre-configured virtual environments for our community.

The bottom line:

    Vagrant/VagrantCloud is essentially git/github for Virtual Machine images.

### Requirements

In order to work through this tutorial, the following is needed:

* A `Vagrant` Install: http://www.vagrantup.com/downloads.html

> Note: A `VagrantCloud` account is not necessary for this tutorial, but it *is* free, and advanced sharing functions require it.  

* A `VirtualBox` install: https://www.virtualbox.org/wiki/Downloads

> Note: This tutorial requires VirtualBox 4.3.10, as well as the `VirtualBox 4.3.10 Oracle VM VirtualBox Extension Pack` download.

* This git repository: https://github.com/WardF/vagrant-tutorial.

> Any and all commands used in this tutorial and/or examples will assume you are in this top-level `vagrant-tutorial/` directory.  


Getting Started
---------------

`Vagrant` is primarily a developer tool, and is designed to be configured on a per-project basis. The configuration file, `Vagrantfile`, contains definitions of the VM's associated with the project.

> The host operating system, referred to as `host` from here on out, can be Windows, OSX, or Linux; any platforms supported by `VirtualBox` and `Vagrant` will do.  The commands in this tutorial will assume a linux or OSX command line.

### Examining Vagrant Configuration

You can view the defined VM configurations for this project with the following command:

    $ vagrant status
    
This will list the following VM configurations:

* `ubuntu_plain`: A base ubuntu 12.04 64-bit system.
* `ubuntu_developer`: A base ubuntu 12.04 64-bit system, plus ubuntu developer tools.
* `ubuntu_webserver`: A base ubuntu 12.04 64-bit system with a running web server.


If you examine the `Vagrantfile` configuration, you will see that all systems inherit from the `hashicorp/precise64` box.  This identifier is mapped through the Vagrant service to a VM image hosted on some remote server. `hashicorp/precise64` is a 64-bit 12.04 Ubuntu system, provided by the Vagrant development team.  **Other** publicly available boxes may be found at https://vagrantcloud.com/discover/featured.

The first time you use `Vagrant` to bring up a VM image, it will look to see if a local version of `hashicorp/precise64` exists.  If it does not, it will go out and fetch it.  You can also download and view it ahead of time with the following commands:

    $ vagrant box add hashicorp/precise64
    $ vagrant box list

    
Using Vagrant to build a plain VM
---------------------------------

Here is how you can create a basic VM with `vagrant`.

    $ vagrant up ubuntu_plain
     
You will be able to watch vagrant create and boot the VM image.  Once it has been created and is running, consider the following commands:

> Note: `ubuntu_plain` is the default configuration, so you will not need to specify a configuration name when using the following commands.  For other configurations, however, you will need to specify which VM instance you want to connect to, halt, destroy, etc.

* `vagrant status`: View the status of the VM's associated with the project.  
* `vagrant ssh`: SSH into the VM instance.
* `vagrant halt`: Halt the VM instance.
* `vagrant suspend`: Suspend the VM instance.
* `vagrant destroy`: Completely destroy the VM instance.

Using Vagrant to build a developer VM
-------------------------------------

Next, lets look at using Vagrant to create a development environment within a VM.  We'll use the `ubuntu_developer` configuration.  Bring it up as follows:

    $ vagrant up ubuntu_developer
    
You can then watch vagrant create and boot the VM image, and then install the developer tools.  You will then be able to use the same commands to interact with the VM.    
    
### Wait a moment! Don't `ubuntu_plain` and `ubuntu_developer` both use the same vagrant box, `hashicorp/precise64`?

Yes, they do!  The developer tools are installed when the VM is `provisioned`.  In this case, vagrant is running the bash script "provision_scripts/bootstrap_script.sh" after bringing up the VM.  This script is run as the `root` user.

Using Vagrant to build a web server VM
--------------------------------------

The final example shows how a basic Vagrant networking example.  We'll use the `ubuntu_webserver` configuration.  

    $ vagrant up ubuntu_webserver
    
This time, vagrant will use the `provision_scripts/bootstrap_web.sh` bash script to provision the server. This script:

* Installs `apache2`, other tools.
* Renders this README.md markdown file into an html document, index.html
* Removes the default index.html in `/var/www/` on the web server.
* Uses the html version of this markdown file as the new default website.

Once the VM is booted, you can view the default apache install by opening a web browser and pointing it at `http://localhost:8080`.  This port forwarding is enabled in the configuration file, and may use arbitrary ports.  Note, Vagrant is smart about port collision and will do its best to prevent it.  

Summary
=======
This tutorial *barely* scratches the surface of Vagrant.  Additional information may be found at the following sites:

* http://www.vagrantup.com - Vagrant Website for developers. 
* http://docs.vagrantup.com/v2/getting-started/index.html - Vagrant documentation.
* https://vagrantcloud.com - The Vagrant cloud service.
* https://vagrantcloud.com/discover/featured - Other VM boxes available for use.