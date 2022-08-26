# Concepts

[[toc]]

## What is an Inspec Profile

An Inspec profile is a collection of security and compliance controls which define an overall policy.

Some organisations (like CIS, or your own enterprise) may call these collections of controls a benchmark, a compliance policy or a security standard.

The logical heirarchy of a profile looks something like this:-

```text
[profile]
  ├─[inputs]
  ├─[profile metadata]
  │
  ├─[control 1.1]
  │   ├─[control metadata]
  │   └─[resource]
  │       └── [one or more tests]
  │
  └─[control 1.2]
      ├─[control metadata]
      ├─[resource]
      |   └── [one or more tests]
      ├─[resource]
      │   └── [one or more tests]
      └─[resource]
          └── [one or more tests]
```

## What is an Inspec Control

An Inspec control is simply one aspect of an overall security policy. An example might be a requirement to have NTP timesources synchronising the time on all devices.

Each control has metadata attached to it so people can understand what the control is for, and how important it is.

The metadata includes:-

* The control policy reference such as `CIS Cisco Nexus Benchmark 1.1.3`
* The control title, which is a bit more desctiptive that the control reference
* The `impact` of the control which ranges from 0.0 (no impact) to 1.0 (critical)
* The description of the control, which usually includes some rationale for why the control matters

The control will also have one or more tests which check the system complies with the control aims.

Examples

```ruby
control "Widgets R Us - Cisco Nexus - NTP 1.1" do
  title  "NTP Timesync Redundancy"
  desc   "Switches must have redundant timesources configured because..."
  impact 0.7

  describe nexus_ntp_peers do
    its('count') { should be >= 2 }
  end
end
```

```ruby
control "Widgets R Us - Cisco Nexus - NTP 1.2" do
  title  "NTP Timesync Reachability"
  desc   "Switches must be able to reach their timesources because..."
  impact 0.3

  describe nexus_ntp_peers.where{ reachability == 0 } do
    its('count')   { should eq 0 }
    its('remotes') { should eq [] }
  end
end
```


## What is an Inspec Resource

An Inspec resource represents some aspect of the system under test. It usually has `properties` that allow more fine grained inspection of the thing being tested

A [control](#what-is-an-inspec-control) uses Inspec resources to check the state of the target system.

In the control example above, we saw a resource called `nexus_ntp_peers` being used.

```ruby
describe nexus_ntp_peers do
  its('count') { should be >= 2 }
end
```

It has a property called `count` which lets us see how many peers have been configured. It also has a proprty called `reachabilities` that allow us to check whether the peers are actually reachable.

## What is an Inspec Resource pack

An Inspec resource pack is just a normal Inspec profile, but it doesn't contain any controls. Instead, it contains `custom resource` definitions. The resource pack can be used by other profiles which simply declare a dependency on the resource pack.

## What Nexus resources are available

See the [Custom Resources](/resources) section for a complete list of Nexus custom resources in this pack.