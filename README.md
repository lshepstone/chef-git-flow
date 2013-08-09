chef-git-flow
=============

Simple Chef cookbook to install git-flow on Linux nodes.

On Debian family nodes, this installs the 'git-flow' package.

On any other Linux, it uses the bash installer provided in the gitflow repo:

https://github.com/nvie/gitflow/wiki/Linux

Recipes
-------

* default: forks to git-flow::package on Debian and git-flow::bash_installer on other Linux variants
* package: installs the git-flow package
* bash_installer: installs git-flow using the bash installer

Note that due to the way submodules have been set up inside the gitflow
repo, if you cannot do a git checkout over SSH, the bash_installer recipe
will fail.  Addressing this will require a patch to the installer itself to
rewrite the .gitmodules file to use the same URL as is used to clone the top
level repo.

Attributes
----------

These attributes are under the node['git-flow'] namespace.  These attributes are only used by the bash_installer recipe.

Name | Type | Description | Default
-----|------|-------------|--------
installer_uri | String | URL to fetch the bash installer from | https://raw.github.com/nvie/gitflow/develop/contrib/gitflow-installer.sh
install_prefix | String | Path to install git-flow in | /usr/local/bin
repo_uri | String | URI to clone git-flow from | http://github.com/nvie/gitflow.git
