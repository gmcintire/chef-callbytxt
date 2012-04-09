Vagrant::Config.run do |config|
  config.vm.box     = "oneiric32_base"
  config.vm.box_url = "http://files.travis-ci.org/boxes/bases/oneiric32_base.box"

  config.vm.forward_port 22, 2220

  config.vm.customize ["modifyvm", :id, "--memory", "1024"]
  # partially helps with Vagrant issue #516, VirtualBox NAT interface chokes when
  # # of slow outgoing connections is large (in dozens or more).
  config.vm.customize ["modifyvm", :id, "--nictype1", "Am79C973"]

  config.vm.provision :chef_solo do |chef|
    # you can use multiple cookbook locations if necessary.
    # For example, to develop both shared OSS cookbooks and your private
    # product/company-specific ones.
    chef.cookbooks_path = ["cookbooks"]
    chef.log_level      = :debug

    # Highly recommended to keep apt packages metadata in sync and
    # be able to use apt mirrors.
    chef.add_recipe     "apt"

    # List the recipies you are going to work on/need.
    chef.add_recipe     "build-essential"
    chef.add_recipe     "git"
    chef.add_recipe     "nodejs"
    chef.add_recipe     "mysql"

    chef.json.merge!({
      user: {
        name: "deployer",
        password: "$1$yuB2Eplz$jU16wHV/zQh092FZBFNbv1",
        ls_color: true
      },
      run_list: ["recipe[callbytxt]"]
    })

  end
end
