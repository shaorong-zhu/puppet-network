module Puppet::Parser::Functions
  newfunction(:map_macaddr_to_interface, :type => :rvalue) do |args|
    macaddr = args[0]
    interfaces = lookupvar("interfaces")

    interfaces.split(",").find { |ifn| lookupvar("macaddress_#{ifn}") =~ /^(?i)#{macaddr}$/ }
  end
end