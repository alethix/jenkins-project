output "jenkins_master_ip" {
 value = "${vsphere_virtual_machine.vm_jenkins_master.default_ip_address}"
}

output "jenkins_agent_ip" {
 value = "${vsphere_virtual_machine.vm_jenkins_agent.*.default_ip_address}"
}

resource "local_file" "ansible_inventory" {
    count = 4
    content = "[jenkins_master]\n${
        vsphere_virtual_machine.vm_jenkins_master.default_ip_address
    }\n[jenkins_agent]\n${join("\n",
            formatlist(
              "%s",
              vsphere_virtual_machine.vm_jenkins_agent.*.default_ip_address
            )
        )}"

    filename = "ansible/inventory"    
}