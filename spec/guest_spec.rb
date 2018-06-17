require 'vagrant-nxos/guest'
require 'vagrant-nxos/plugin'
require 'vagrant-nxos/cap/change_host_name'
require 'vagrant-nxos/cap/configure_networks'
require 'vagrant-nxos/cap/halt'

describe VagrantPlugins::GuestNxOS::Plugin do
  it 'should be loaded with nxos' do
    p described_class.components.guests[:nxos].first
    expect(described_class.components.guests[:nxos].first).to eq(VagrantPlugins::GuestNxOS::Guest)
  end

  {
    change_host_name: VagrantPlugins::GuestNxOS::Cap::ChangeHostName,
    configure_networks: VagrantPlugins::GuestNxOS::Cap::ConfigureNetworks,
    halt: VagrantPlugins::GuestNxOS::Cap::Halt,
  }.each do |cap, cls|
    it "should be capable of #{cap} with nxos" do
      expect(described_class.components.guest_capabilities[:nxos][cap])
        .to eq(cls)
    end
  end
end
