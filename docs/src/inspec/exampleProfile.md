# Example Profile

[[toc]]

## Creating a custom Nexus profile

### Generating the profile skeleton

First of all, lets make a skeleton wrapper profile

```bash
# Make a profile skeleton
inspec init profile nexus-example
cd example

# Take a look at the directory structure (linux command line)
tree
```
### Adding a dependency on inspec-cisco-nexus

Update the metadata in `inspec.yml` and make it depend on the Inspec Cisco Nexus resource pack

```yaml{2,7,12-15,17-20}
name: nexus-example
title: Example profile for Nexus switches
maintainer: Richard Nixon
copyright: Richard Nixon
copyright_email: richard.nixon@btinternet.com
license: Apache-2.0
summary: Example profile for Nexus switches
version: 0.1.0
supports:
  platform: os

# Get dependencies using a URL (if you don't have git installed)
depends:
- name: inspec-cisco-nexus
  url:  https://github.com/trickyearlobe/inspec-cisco-nexus

# Get dependencies using a GIT reference (preferred method to get specific versions)
# depends:
# - name: inspec-cisco-nexus
#   git:  https://github.com/trickyearlobe/inspec-cisco-nexus9k.git, branch: main
```

### Adding some controls

Edit `controls/example.rb` and make it look like this

```ruby
control "Example - Cisco Nexus - NTP 1.1" do
  title  "NTP Timesync Redundancy"
  desc   "Switches must have redundant timesources configured because..."
  impact 0.7

  describe nexus_ntp_peers do
    its('count') { should be >= 2 }
  end
end

#------------------------------------------------------------------------

control "Example - Cisco Nexus - NTP 1.2" do
  title  "NTP Timesync Reachability"
  desc   "Switches must be able to reach their timesources because..."
  impact 0.3

  describe nexus_ntp_peers.where{ reachability == 0 } do
    its('count')   { should eq 0 }
    its('remotes') { should eq [] }
  end
end
```

## Running your profile against Nexus Switches

Getting ready to run the profile

```bash
# Make sure we are in the right directory
cd <path to nexus-example directory>
```
Getting the dependencies if required (mandatory for first run)

```bash
# The `.` means use the profile in the current directory
inspec vendor .

# If we want to update the dependencies we need to
# forcibly overwrite the local copy
inspec vendor . --overwrite
```

### Scanning using SSH key based authentication

```bash
# The "." means use the profile in the current directory
inspec exec . -t ssh://my.nexus.fqdn
```

### Scanning as a specific user

```bash
# The "." means use the profile in the current directory
inspec exec . -t ssh://admin@my.nexus.fqdn
```

### Scanning using SSH with password authentication (bad)

```bash
# The "." means use the profile in the current directory
inspec exec . -t ssh://admin:password@my.nexus.fqdn
```

### Packaging our finished profile

If we want to distribute this profile to others, or upload it to Chef Automate where we can collect results of scheduled scans, we need to create a profile archive.

```bash
# Change to the directory above our profile
# Assuming we are in nexus-example directory
cd ..

# Now create the archive
inspec archive nexus-example
```

### Running our packaged profile

```bash
inspec exec nexus-example-1.0.0.tar.gz -t ssh://my.nexus.fqdn
```
