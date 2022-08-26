# nexus ntp peers

[[toc]]

## Description

`nexus_ntp_peers` is an Inspec plural resource which retrieves the operational status of any NTP peers that have been configured on the system.

It can tell if they are reachable, and it can tell which timesource is being used for sync.

As a plural resource, it supports filters which allow selection and testing of peers which meet specific criteria.

## Examples

Check we have 3 NTP peers configured

```ruby
describe nexus_ntp_peers do
  its('count') {should eq 3}
end
```

Check that all the peers are reachable.

If they are not, the diff will show the remotes (IP's) that are not reachable

```ruby
describe nexus_ntp_peers.where{ reachability == 0 } do
  its('count')   {should eq 0}
  its('remotes') {should eq []}
end
```
## Properties

| Singular      | Plural         | Type    | Description                                                                                                |
|---------------|----------------|---------|------------------------------------------------------------------------------------------------------------|
|               | count          | integer | The number of entries in the ntp peer table                                                                |
|               | entries        | array   | An array of hashes that contain the data for each peer. This data can be iterated in a loop                |
| delay         | delays         | string  | The RTT between switch and ntp server                                                                      |
| local         | locals         | string  | The local IP used reach the NTP peer                                                                       |
| poll_interval | poll_intervals | integer | The interval between polls                                                                                 |
| reachability  | reachabilities | integer | An 8 bit shift register (in octal) that tracks successive poll responses. Best = 377, 0 = unreachable      |
| remote        | remotes        | string  | The remote IP of the peer                                                                                  |
| stratum       | stratums       | integer | In a chain of networked timeservers, how close our peer is to the root timeserver                          |
| syncmode      | syncmodes      | string  | `*` selected for sync<br> `+` peer mode (active)<br> `-` peer mode (passive)<br> `=` polled in client mode |
| vrf           | vrfs           | string  | Indicates which VRF (virtual routing/forwarding instance) is used to contact the peer                      |