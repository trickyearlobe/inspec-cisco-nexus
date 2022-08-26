---
home: true
heroImage: /nexus9504.webp
tagline: An Inspec resource pack for Cisco Nexus switches
actionText: Get Started →
actionLink: /inspec/
features:
- title: Extends Chef Inspec
  details: Chef Inspec is framework for automating security and compliance checks with easy to understand code. This resource pack extends Inspec to allow it to connect to, and understand Cisco nexus devices.
- title: Audits your Nexus switches
  details: Do you find it hard to prove to your security or compliance leader that your Nexus switches are secure? This Inspec resource pack helps you do that using the power of Chef Inspec in a repeatable manner.
- title: Works with Chef Automate
  details: If you need an easy way to schedule Inspec compliance scans and produce historical dashboards, you can use Chef Automate. This resource pack is tested and fully compatible with Chef Automate.
# footer: Copyright © 2022-present Richard Nixon https://github.com/trickyearlobe
---

### An example compliance control

```ruby{5-7}
control "Nexus Policy 1.1" do
  title "NTP Timesync"
  desc  "Nexus switches must have redundant timesources configured"

  describe nexus_ntp_peers do
    its('count') { should eq 2 }
  end
end
```

::: slot footer
Copyright © 2022-present [Richard Nixon](https://github.com/trickyearlobe)
:::