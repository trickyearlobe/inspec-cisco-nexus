class NexusNtpPeers < Inspec.resource(1)
  name 'nexus_ntp_peers'

  # FilterTable setup
  filter_table = FilterTable.create
    .register_column(:delays, field: :delay)
    .register_column(:locals, field: :local)
    .register_column(:poll_intervals, field: :poll_interval)
    .register_column(:reachabilities, field: :reachability)
    .register_column(:remotes, field: :remote)
    .register_column(:stratums, field: :stratum)
    .register_column(:syncmodes, field: :syncmode)
    .register_column(:vrfs, field: :vrf)
    .install_filter_methods_on_resource(self, :data_table)

  def data_table
    @ntpstate ||= inspec.nexus_command('show ntp peer-status |json')
    raise @ntpstate.stderr unless @ntpstate.exit_status == 0

    # The rows are in ROW_peersstatus but they need to be coerced
    # into an Array when there is only one row (naughty Cisco)
    @rawRows ||= Array(
      JSON.parse(@ntpstate.stdout)['TABLE_peersstatus']['ROW_peersstatus']
    )

    # Do a bit of field renaming and type conversion
    @cleanRows ||= @rawRows.map do |row|
      {
        "delay":          row['delay'].to_f,
        "local":          row['local'],
        "poll_interval":  row['poll'].to_i,
        "reachability":   row['reach'].to_i,
        "remote":         row['remote'],
        "stratum":        row['st'].to_i,
        "syncmode":       row['syncmode'],
        "vrf":            row['vrf']
      }
    end
    # @ntpRows
  end

  def to_s
    "Nexus NTP peers"
  end
end
