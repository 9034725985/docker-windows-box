# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.7.4"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box          = "windows_2016_docker"
  config.vm.communicator = "winrm"

  ["vmware_fusion", "vmware_workstation"].each do |provider|
    config.vm.provider provider do |v, override|
      v.gui = true
      v.vmx["memsize"] = "4096"
      v.vmx["numvcpus"] = "2"
      v.vmx["vhv.enable"] = "TRUE"
      v.enable_vmrun_ip_lookup = false
    end
  end

  config.vm.provider "vmware_fusion" do |v|
    v.vmx["gui.fitguestusingnativedisplayresolution"] = "TRUE"
    v.vmx["mks.enable3d"] = "TRUE"
    v.vmx["mks.forceDiscreteGPU"] = "TRUE"
    v.vmx["gui.fullscreenatpoweron"] = "TRUE"
    v.vmx["gui.viewmodeatpoweron"] = "fullscreen"
    v.vmx["gui.lastPoweredViewMode"] = "fullscreen"
    v.vmx["sound.startconnected"] = "TRUE"
    v.vmx["sound.present"] = "TRUE"
    v.vmx["sound.autodetect"] = "TRUE"
  end

  config.vm.provision "shell", path: "scripts/install-chocolatey.ps1", privileged: false
  config.vm.provision "shell", path: "scripts/install-git.ps1", privileged: false
  config.vm.provision "shell", path: "scripts/install-dockertools.ps1", privileged: false
  #config.vm.provision "shell", path: "scripts/create-hyperv-linux-docker-machine.ps1", privileged: false
  #config.vm.provision "shell", path: "scripts/update-nightly-docker.ps1", privileged: false
end
