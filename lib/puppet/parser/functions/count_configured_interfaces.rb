module Puppet::Parser::Functions
  newfunction(:count_configured_interfaces, :type => :rvalue) do |args|
    macaddr = args[0]
    interfaces = lookupvar("interfaces")

    interfaces.split(",").count { |ifn| lookupvar("macaddress_#{ifn}") =~ /^#{macaddr}$/ }
  end
end