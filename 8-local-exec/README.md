Provisoners (local-exec, remote-exec, for example) should be used only as last resort.

The local-exec provisioner invokes a local executable after a resource is created. This invokes a process on the machine running Terraform, not on the resource. See the remote-exec provisioner to run commands on the resource.