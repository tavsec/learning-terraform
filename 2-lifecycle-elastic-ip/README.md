## Syntax
```hcl
resource "aws_instance" "example" {
  # ...

  lifecycle {
    create_before_destroy = true

    prevent_destroy = false

    # Ignore changes to tags, e.g. because a management agent
    # updates these based on some ruleset managed elsewhere.
    ignore_changes = [
        tags
    ]

    replace_triggered_by = [
        # Replace `aws_appautoscaling_target` each time this instance of
        # the `aws_ecs_service` is replaced.
        aws_ecs_service.svc.id
    ]

    # The AMI ID must refer to an AMI that contains an operating system
    # for the `x86_64` architecture.
    precondition {
      condition     = data.aws_ami.example.architecture == "x86_64"
      error_message = "The selected AMI must be for the x86_64 architecture."
    }
  }
}
```
## More
https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle
https://developer.hashicorp.com/terraform/language/resources/behavior