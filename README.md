# opentofu-sg-webserver

A set of rules to apply to EC2 instances acting as private or public
webservers. The idea is that you can use this module to instantiate multiple
similar security groups for different purposes.

# Input variables

The following input variables are supported:

* **vpc_id**: the ID of the VPC to create this security group in
* **basename**: a prefix to add to the security group name. Allows instantiating this security group multiple times in the same VPC with different settings.
* **type**: either *private* or *public*. This parameter is informal only: it shows up in names but does not affect functionality.
* **allow_http_cidr_blocks** (default: allow any)
* **allow_https_cidr_blocks** (default: allow any)
* **allow_http_ipv6_cidr_blocks** (default: allow any)
* **allow_https_ipv6_cidr_blocks** (default: allow any)

See [input.tf](input.tf) for details.

# Output variables

This module outputs the following variables:

* **id**: the security group ID

See [output.tf](output.tf) for details.

# Example usage

Create a public webserver security group:

```
module "production-sg-webserver" {
  source   = "github.com/Puppet-Finland/opentofu-sg-webserver.git"
  basename = "production"
  vpc_id   = module.production-vpc.vpc_id
  type     = "public"
}
```
