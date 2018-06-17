require "vagrant"

require Vagrant.source_root.join("plugins/guests/linux/guest")

module VagrantPlugins
  module GuestNxOS
    class Guest < VagrantPlugins::GuestLinux::Guest
      def detect?(machine)
        machine.communicate.test("cat /etc/os-release | grep -e 'Nexus'")
      end
    end
  end
end
