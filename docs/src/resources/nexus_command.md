# nexus command

[[toc]]

## Description

`nexus_command` is a singular inspec resource which can run arbitrary NX-OS commands
on the nexus target switch and inspect their output. It can be used to make checks
if there is no specialised resource available.

## Examples

Check that the running config doesn't have any access lists which permit "ANY ANY" traffic

```ruby
describe nexus_command('show running config') do
  its('stdout') {should not match /permit ip any any/}
end
```

Check that the clock has a timezone configured

```ruby
describe nexus_command('show running-config | include timezone') do
  its('stdout') { should match /^clock timezone/ }
end
```


## Properties

| Property    | Type    | Description                        |
|-------------|---------|------------------------------------|
| stdout      | string  | the standard output of the command |
| stderr      | string  | the error output of the command    |
| exit_status | integer | The return code of the command     |
