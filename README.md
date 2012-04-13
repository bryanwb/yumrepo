Description
===========

Manages Yum Repository files in /etc/yum.repos.d on CentOS / RHEL 5.x.

Yum repositories included in this recipe:
EPEL, ELFF, Dell OMSA, Dell Community, Dell Firmware, VMware Tools, and more...

Requirements
============

This cookbook requires RHEL or CentOS 5.x, and newer.
It has not been tested on other platforms.  It probably will
not work with RHEL 4 or CentOS 4, especially if you have not
taken action to manually install yum on that platform.

Notes
-----

RHEL 6 support is very new, and has been tested on only a few systems.
Let me know if you find a bug, related to one of the recipes.

The yumrepo::dell recipe requires Dell manufactured hardware.  This
recipe should automatically disable itself if non-Dell hardware is
detected by Ohai

The yumrepo::vmware-tools recipe requires a VMWare Virtual Machine.
This recipe should automatically disable itself if non-VMWare hardware
is detected by Ohai.

Individual Recipe Usage:
=======================

yumrepo::default
----------------

Includes recipes:

* yum::yum
* epel
* dell
* vmware-tools
* corp-epel     # this points to your local, corporate repository

yumrepo::epel
-------------

- Provides RPM keys and repo file for
   Fedora EPEL (Extra Packages for Enterprise Linux)
  * See http://fedoraproject.org/wiki/EPEL for more info

yumrepo::elff
-------------

- ELFF repo is deprecated, this is left in to clean up leftover repo files.

yumrepo::dell
-------------

- Provides repo files for the following Dell repositories.
  - hardware / Open Manage Server Administrator
  - community / formerly the software repository
  - firmware / Convenient but unsupported by Dell
  * See http://linux.dell.com for more info

# Attributes

- repo[:dell][:download_firmware] = true||false
  * disables/enables community/firmware repositories in dell recipe
  * OMSA (hardware) repository will detect Dell hardware platform and
    enable itself, dynamically. It is not affected by this attribute.

yumrepo::rbel

- Provides repo files for rbel.frameos.org
  * Ruby and Opscode Chef packages for RHEL distros 

yumrepo::vmware-tools
---------------------

- Uninstalls VMwareTools rpm installed from the
   VMware ESX "Install/Upgrade VMware Tools" menu
- Uninstalls manually installed vmware-tools
   packages, the recipe needs to first run
   vmware-uninstall-tools.pl to use the RPM packages
   from the repo.
- Provides RPM keys and repo file for
   VMware Tools for the ESX 4.1 release
  * See http://packages.vmware.com for more info

# Attributes

- repo[:vmware][:release] (ESX version number, default 4.1)
  * This is used to determine the correct URL in the
    VMware RHEL5/CentOS repository.

- repo[:vmware][:install_optional] = true||false
  * Whether or not VMware's optional mouse, and X11
    drivers should be installed in the vmware-tools recipe.

yumrepo::corp-epel
---------------------

- Provides a repo file for your corporate, private repository
  of rpms

# Attributes

- repo[:corp][:repo_name] (no default) 
  * This is the name of your repository 

- repo[:corp][:base_url] ( no default ) 


yumrepo::annvix
---------------

- Annvix repository for packages usable with Red Hat Enterprise Linux and
   CentOS.
  * See http://annvix.org for more information.


yumrepo::postgresql9
--------------------

- PostgreSQL 9.0 RPMs
  * See http://pgrpms.org for more information.

yumrepo::zenoss
---------------

- ZenOss Network Monitoring System
  * See http://zenoss.org for more information

License and Author
==================

Author:: Eric G. Wolfe
Copyright:: 2010-2011

Author:: Tippr, Inc.
Copyright:: 2010

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
