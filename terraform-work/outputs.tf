output "jenkins_master_ip" {
 value = "${vsphere_virtual_machine.vm_jenkins_master.default_ip_address}"
}

output "jenkins_agent_ip" {
 value = "${vsphere_virtual_machine.vm_jenkins_agent.*.default_ip_address}"
}

resource "local_file" "ansible_inventory" {
    count = 4
    content = "[Jenkins_Master]\n ${
        jenkins_master_ip.value
    }\n[Jenkins_Agent]\n${join("\n",
            formatlist(
              "%s",              
              jenkins_agent_ip.value
            )
        )}"

    filename = "ansible/inventory"    
}