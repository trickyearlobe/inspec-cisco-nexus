# Base class for Cisco IOS devices used for sharing methods with other resources
class NexusCommand < Inspec.resource(1)
  name 'nexus_command'

  def initialize(command)
    @command = command
    @result = inspec.backend.run_command(command)
  end

  def stdout
    @result.stdout
  end

  def stderr
    @result.stderr
  end

  def exit_status
    @result.exit_status
  end

  def to_s
    "NexusCommand: '#{@command}'"
  end
end