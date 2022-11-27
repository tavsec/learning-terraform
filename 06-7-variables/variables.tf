variable "aws_region" {
  description = "Which region to deploy to?"
  type        = string
  default     = "eu-central-1"
}

variable "ingress_ports" {
  description = "Which ingress ports are open?"
  type = list(object({
    internal = number
    external = number
    protocol = string
  }))
  default = [
    {
      internal = 80
      external = 80
      protocol = "tcp"
    },
    {
      internal = 443
      external = 443
      protocol = "tcp"
    }
  ]
}
