class NexusFeatures < Inspec.resource(1)

  # This is the name which gets exposed in the Inspec DSL
  name "nexus_features"

  # Set up a filter table to expose the data in "cached_data" as singular and plural accessors
  filter_table = FilterTable.create
  .register_column(:instances, field: :instance)
  .register_column(:names,     field: :name)
  .register_column(:states,    field: :state)
  .register_column(:reasons,   field: :reason)

  # Attach the filter table to the data
  filter_table.install_filter_methods_on_resource(self, :cached_data)

  # Cache the fetched data in an class variable so we
  # only hit the router once for a feature list
  # CAVEAT: We must not scan multiple targets in one ruby process
  def cached_data
    @@data ||= rename_fields(fetch_data)
  end

  # Fetch and parse the JSON data about licenced features
  # A specific feature (eg. EIGRP) may have more than one instance.
  def fetch_data
    raw_json = inspec.nexus_command('show feature | json').stdout
    JSON.parse(raw_json)["TABLE_cfcFeatureCtrlTable"]["ROW_cfcFeatureCtrlTable"]
  end

  # Clean up Cisco's horrible field names and return just the ones we need
  def rename_fields(original)
    original.map do |row|
      {
        instance: row['cfcFeatureCtrlInstanceNum2'],
        name:     row['cfcFeatureCtrlName2'],
        state:    row['cfcFeatureCtrlOpStatus2'],
        reason:   row['cfcFeatureCtrlOpStatusReason2'],
      }
    end
  end
end

#######################################################################
#    Example Cisco fields returned from "show features | json-pretty"
#######################################################################
#
#  {
#    "TABLE_cfcFeatureCtrlTable": {
#      "ROW_cfcFeatureCtrlTable": [
#        {
#          "cfcFeatureCtrlIndex2": "109",
#          "cfcFeatureCtrlInstanceNum2": "0",
#          "cfcFeatureCtrlName2": "Flexlink",
#          "cfcFeatureCtrlAction2": "1",
#          "cfcFeatureCtrlLastAction2": "1",
#          "cfcFeatureCtrlLastActionResult2": "1",
#          "cfcFeatureCtrlLastFailureReason2": null,
#          "cfcFeatureCtrlOpStatus2": "disabled",
#          "cfcFeatureCtrlOpStatusReason2": "feature never enabled",
#          "cfcFeatureCtrlTag2": null
#        }
#      ]
#    }
#  }
#
#######################################################################
