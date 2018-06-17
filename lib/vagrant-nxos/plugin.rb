require "vagrant"

module VagrantPlugins
  module GuestNxOS
    class Plugin < Vagrant.plugin("2")
      name "NxOS guest"
      description "NxOS guest support."

      guest("nxos", "linux") do
        require File.expand_path("../guest", __FILE__)
        Guest
      end

      guest_capability("nxos", "halt") do
        require_relative "cap/halt"
        Cap::Halt
      end

      guest_capability("nxos", "configure_networks") do
        require_relative "cap/configure_networks"
        Cap::ConfigureNetworks
      end

      guest_capability("nxos", "change_host_name") do
        require_relative "cap/change_host_name"
        Cap::ChangeHostName
      end

    end
  end
end
