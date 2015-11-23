module Puppet::Parser::Functions
  newfunction(:get_seq_interface, :type => :rvalue) do |args|
    seq = args[0]
    interfaces = lookupvar("interfaces")

    interfaces.split(",").reject { |ifn| ifn == "lo" }.sort[seq]
  end
end
