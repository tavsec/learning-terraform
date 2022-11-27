resource "null_resource" "command1" {
    provisioner "local-exec" {
      command = "echo Terraform START: $(date) >> log.txt"
    }
}

resource "null_resource" "python" {
    provisioner "local-exec" {
        interpreter = [
          "python", "-c"
        ]
      command = "print('Hello from Python')"
    }
}

resource "aws_instance" "web" {
    # ...
    provisioner "local-exec" {
        interpreter = [
          "python", "-c"
        ]
      command = "print('Hello from Python')"
    }
}

resource "aws_instance" "web2" {
  # ...

  provisioner "local-exec" {
    command = "echo $FOO $BAR $BAZ >> env_vars.txt"

    environment = {
      FOO = "bar"
      BAR = 1
      BAZ = "true"
    }
  }
}