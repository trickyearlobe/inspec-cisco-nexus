# nexus features

[[toc]]

## Description

`nexus_features` is an Inspec plural resource which retrieves the optional licenced features
of the Nexus switch. In some cases, a feature may have many instances and so we chose to
represent this with a plural resource than can use a `.where()` or `.where{}` resource.

## Examples

Check if eigrp feature is enabled

```ruby
describe nexus_features.where(name:"eigrp",state:"enabled") do
  its('states') { should include "enabled" }
end
```

Skipping a control if a feature is not enabled

```ruby
control "EIGRP - test control" do
  title "EIGRP should be configured properly"
  desc  "All kinds of issues may occur if EIGRP is misconfigured"

  # Pseudocode - this isn't a real resource
  describe an_example_eigrp_resource do
    its('configuration') { should be correct }
  end

  # Skip this control if eigrp feature is not enabled.
  only_if "This check is only required if EIGRP is enabled" do
    nexus_features.where(name:"eigrp",state:"enabled").exist?
  end
end
```

## Properties

| Singular      | Plural         | Type    | Description                                                                                                |
|---------------|----------------|---------|------------------------------------------------------------------------------------------------------------|
|               | count          | integer | The number of entries in the nexus_features table                                                          |
|               | entries        | array   | An array of hashes that contain the data for each feature. This data can be iterated in a loop             |
| instance      | instances      | string  | The instance number of the feature (used when a licence may grant a quantity)                              |
| name          | names          | string  | The name of the feature                                                                                    |
| state         | states         | string  | Whether the resource is `enabled`, `enabled(not-running)` or `disabled`                                    |
| reason        | reasons        | integer | The reason a feature is in the state. eg. `feature never enabled`, `SUCCESS`                               |
