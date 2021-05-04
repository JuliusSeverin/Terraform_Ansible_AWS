resource "local_file" "AnsibleInventory" {

  filename             = "ansible/hosts"
  directory_permission = "0600"
  file_permission      = "0600"

  # templatefiles function with vars. Saves ec2 output to hosts with use of inventory.tmpl

  content = templatefile("${path.cwd}/templates/inventory.tmpl", {
    "node_name"       = var.node_name,
    "node_ip"         = var.node_ip,
    "control_name"    = var.control_name,
    "control_ip"      = var.control_ip,
    "node_priv_ip"    = var.node_priv_ip,
    "control_priv_ip" = var.control_priv_ip,
    "all_hosts"       = "[all]",
    "controllers"     = "[controllers]",
    "controllerspriv" = "[controllers_priv]",
    "workers"         = "[workers]",
    "workerspriv"     = "[workers_priv]",
    "addprivto"       = "priv"
  })
}
