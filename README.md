# Inspec Cisco Nexus Resource Pack

A resource pack that provides Inspec resources for checking Cisco Nexus switches.

[Full documentation is available in GitHub pages](https://trickyearlobe.github.io/inspec-cisco-nexus)

# Using the resource pack

First, generate a new profile

```bash
inspec init profile my-nexus-profile
```

Then, add a `depends` statement to the `inspec.yml`. In this case we create a dependency using the URL of the resource pack GIT repo

```yaml
name: my-nexus-profile
title: my-nexus-profile
maintainer: Richard Nixon
copyright: Richard Nixon
copyright_email: richard.nixon@btinternet.com
license: Apache-2.0
summary: A wrapper profile for testing Nexus switches
version: 0.1.0
supports:
  platform: os

# These lines are added to pull in the resource pack
depends:
- name: inspec-cisco-nexus9k
  git: https://github.com/trickyearlobe/inspec-cisco-nexus
```

Finally, vendor the resource pack into your wrapper profile using the `--overwrite` flag.
Do this each time there is a new release of the resource pack.

```bash
inspec vendor <path to wrapper profile directory> --overwrite
```

You can find an example wrapper profile at [inspec-cisco-nexus-cis-benchmark](https://github.com/trickyearlobe/inspec-cisco-nexus-cis-benchmark)

# Scanning a nexus switch

To scan a remote switch, we use the SSH transport from the Inspec Train backend.

```bash
# Using SSH key based authentication (typically ~/.ssh/id_rsa)
inspec exec <path to wrapper profile> -t ssh://user@nexus.fqdn

# Using SSH key based authentication, overriding the username
inspec exec <path to wrapper profile> -t ssh://user@nexus.fqdn

# Using password authentication (not recommended)
inspec exec <path to wrapper profile> -t ssh://user:password@nexus.fqdn
```

If you want to automate the scans from a Chef run, you can use the [Remote Audit Cookbook](https://github.com/trickyearlobe/remote_audit)
but you can also use `cron` jobs, Jenkins pipelines or any other scheduling mechanism you like.


# Contributing

1. Fork the repo
2. Make a branch for your feature/bugfix
3. Raise a PR from your fork to the original repo in the normal GitHub way
4. Keep an eye on the PR in case changes are needed before merging

In general, run cookstyle on your code and try to obey its pernicketyness where it's not hard to do so.

# Bugs

Report bugs at https://github.com/trickyearlobe/inspec-cisco-nexus9k/issues

Try to include:-

* some context about what you were trying to do (in case there is a better way)
* the steps to reproduce the issue (so we can try in the lab)
* what you expected to happen
* what actually happened, along with any error messages or stack traces

Code and error/stacktrace output should use Markdown code blocks for readability.

# Authors

| Name          | Github ID                                          |
|---------------|----------------------------------------------------|
| Richard Nixon | [trickyearlobe](https://github.com/trickyearlobe)  |
