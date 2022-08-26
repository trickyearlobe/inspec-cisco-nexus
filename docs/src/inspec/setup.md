# Setup

[[toc]]


## Installing Chef Workstation for Inspec development

Chef Workstation is a collection of tools for authoring and testing Chef Infra and Chef Inspec code.
It's only necessary to install it on developer machines

Scanning of Nexus switches is agentless and is done over SSH, though Cisco do maintain an installable
native client. It's unclear what the currently available version is, or whether it contains Inspec.

Scanning of normal OS'es (Linux, Mac, Windows) can be done remotely over SSH/WinRM but you can also
run Inspec profiles on them locally is the Chef Infra Client is installed as it is bundled with the
Inspec client.

### Installing on a Mac

Using [homebrew package manager](https://brew.sh) you can simply

```bash
brew install chef-workstation
```

### Installing on Windows

Using [Chocolatey package manager](https://chocolatey.org/) you can simply

```powershell
choco install chef-workstation
```

### Installing on (RH)EL based Linux

Add this content to a file called `/etc/yum.repos.d/chef-stable.repo`

```bash
[chef-stable]
name=chef-stable
baseurl=https://packages.chef.io/repos/yum/stable/el/$releasever/$basearch/
gpgkey=https://packages.chef.io/chef.asc
gpgcheck=1
enabled=1
```

And then install packages as normal

```bash
yum install chef-workstation -y
```

### Installing on Debian based Linux

Select an APT repo from [this location](https://packages.chef.io/repos/apt/stable/) using the correct distro and version number

The install the package as normal

```bash
apt update
apt install chef-workstation
```

### Installing using Chef downloads site

If you can't install Chef workstation with a package manager (perhaps you're airgapped from the internet) you (or your administrator) can get the packages from the [Chef Downloads](https://www.chef.io/downloads/get-started/infrastructure-management) site.
