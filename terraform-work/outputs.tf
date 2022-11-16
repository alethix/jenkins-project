output "jenkins_master_ip" {
 value = "${vsphere_virtual_machine.vm_jenkins_master.default_ip_address}"
}

# output "jenkins_agent_ip" {
#  value = "${vsphere_virtual_machine.vm_jenkins_agent.*.default_ip_address}"
# }