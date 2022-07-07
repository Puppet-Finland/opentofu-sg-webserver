variable "vpc_id" {
  type = string
}

variable "basename" {
  type = string
}

variable "type" {
  type        = string
  description = "Type of this webserver security group (public or private)."

  validation {
    condition     = length(regexall("^(public|private)$", var.type)) > 0
    error_message = "ERROR: Valid types are \"public\" and \"private\"!"
  }
}

variable "allow_http_cidr_blocks" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "allow_https_cidr_blocks" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "allow_http_ipv6_cidr_blocks" {
  type    = list(string)
  default = ["::/0"]
}

variable "allow_https_ipv6_cidr_blocks" {
  type    = list(string)
  default = ["::/0"]
}
