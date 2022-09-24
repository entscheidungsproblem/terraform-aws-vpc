variable "create_vpc" {
  description = "Controls if VPC should be created (it affects almost all resources)"
  type        = bool
  default     = true
}

variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "0.0.0.0/0"

  validation {
    condition     = can(cidrhost(var.cidr, 0))
    error_message = "Must be valid IPv4 CIDR."
  }
}

variable "enable_ipv6" {
  description = "Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IP addresses, or the size of the CIDR block."
  type        = bool
  default     = false
}

variable "private_subnet_ipv6_prefixes" {
  description = "Assigns IPv6 private subnet id based on the Amazon provided /56 prefix base 10 integer (0-256). Must be of equal length to the corresponding IPv4 subnet list"
  type        = list(number)
  default     = []
}

variable "public_subnet_ipv6_prefixes" {
  description = "Assigns IPv6 public subnet id based on the Amazon provided /56 prefix base 10 integer (0-256). Must be of equal length to the corresponding IPv4 subnet list"
  type        = list(number)
  default     = []
}

variable "outpost_subnet_ipv6_prefixes" {
  description = "Assigns IPv6 outpost subnet id based on the Amazon provided /56 prefix base 10 integer (0-256). Must be of equal length to the corresponding IPv4 subnet list"
  type        = list(number)
  default     = []
}

variable "database_subnet_ipv6_prefixes" {
  description = "Assigns IPv6 database subnet id based on the Amazon provided /56 prefix base 10 integer (0-256). Must be of equal length to the corresponding IPv4 subnet list"
  type        = list(number)
  default     = []
}

variable "redshift_subnet_ipv6_prefixes" {
  description = "Assigns IPv6 redshift subnet id based on the Amazon provided /56 prefix base 10 integer (0-256). Must be of equal length to the corresponding IPv4 subnet list"
  type        = list(number)
  default     = []
}

variable "elasticache_subnet_ipv6_prefixes" {
  description = "Assigns IPv6 elasticache subnet id based on the Amazon provided /56 prefix base 10 integer (0-256). Must be of equal length to the corresponding IPv4 subnet list"
  type        = list(number)
  default     = []
}

variable "intra_subnet_ipv6_prefixes" {
  description = "Assigns IPv6 intra subnet id based on the Amazon provided /56 prefix base 10 integer (0-256). Must be of equal length to the corresponding IPv4 subnet list"
  type        = list(number)
  default     = []
}

variable "assign_ipv6_address_on_creation" {
  description = "Assign IPv6 address on subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map_public_ip_on_launch"
  type        = bool
  default     = false
}

variable "private_subnet_assign_ipv6_address_on_creation" {
  description = "Assign IPv6 address on private subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map_public_ip_on_launch"
  type        = bool
  default     = null
}

variable "public_subnet_assign_ipv6_address_on_creation" {
  description = "Assign IPv6 address on public subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map_public_ip_on_launch"
  type        = bool
  default     = null
}

variable "outpost_subnet_assign_ipv6_address_on_creation" {
  description = "Assign IPv6 address on outpost subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map_public_ip_on_launch"
  type        = bool
  default     = null
}

variable "database_subnet_assign_ipv6_address_on_creation" {
  description = "Assign IPv6 address on database subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map_public_ip_on_launch"
  type        = bool
  default     = null
}

variable "redshift_subnet_assign_ipv6_address_on_creation" {
  description = "Assign IPv6 address on redshift subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map_public_ip_on_launch"
  type        = bool
  default     = null
}

variable "elasticache_subnet_assign_ipv6_address_on_creation" {
  description = "Assign IPv6 address on elasticache subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map_public_ip_on_launch"
  type        = bool
  default     = null
}

variable "intra_subnet_assign_ipv6_address_on_creation" {
  description = "Assign IPv6 address on intra subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map_public_ip_on_launch"
  type        = bool
  default     = null
}

variable "secondary_cidr_blocks" {
  description = "List of secondary CIDR blocks to associate with the VPC to extend the IP Address pool"
  type        = list(string)
  default     = []

  validation {
    condition     = alltrue([for cidr in var.secondary_cidr_blocks : can(cidrhost(cidr, 0))])
    error_message = "Must all be valid IPv4 CIDRs."
  }
}

variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  type        = string
  default     = "default"
}

variable "public_subnet_suffix" {
  description = "Suffix to append to public subnets name"
  type        = string
  default     = "public"
}

variable "private_subnet_suffix" {
  description = "Suffix to append to private subnets name"
  type        = string
  default     = "private"
}

variable "outpost_subnet_suffix" {
  description = "Suffix to append to outpost subnets name"
  type        = string
  default     = "outpost"
}

variable "intra_subnet_suffix" {
  description = "Suffix to append to intra subnets name"
  type        = string
  default     = "intra"
}

variable "database_subnet_suffix" {
  description = "Suffix to append to database subnets name"
  type        = string
  default     = "db"
}

variable "redshift_subnet_suffix" {
  description = "Suffix to append to redshift subnets name"
  type        = string
  default     = "redshift"
}

variable "elasticache_subnet_suffix" {
  description = "Suffix to append to elasticache subnets name"
  type        = string
  default     = "elasticache"
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = []

  validation {
    condition     = alltrue([for cidr in var.public_subnets : can(cidrhost(cidr, 0))])
    error_message = "Must all be valid IPv4 CIDRs."
  }
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = []

  validation {
    condition     = alltrue([for cidr in var.private_subnets : can(cidrhost(cidr, 0))])
    error_message = "Must all be valid IPv4 CIDRs."
  }
}

variable "outpost_subnets" {
  description = "A list of outpost subnets inside the VPC"
  type        = list(string)
  default     = []

  validation {
    condition     = alltrue([for cidr in var.outpost_subnets : can(cidrhost(cidr, 0))])
    error_message = "Must all be valid IPv4 CIDRs."
  }
}

variable "database_subnets" {
  description = "A list of database subnets"
  type        = list(string)
  default     = []

  validation {
    condition     = alltrue([for cidr in var.database_subnets : can(cidrhost(cidr, 0))])
    error_message = "Must all be valid IPv4 CIDRs."
  }
}

variable "redshift_subnets" {
  description = "A list of redshift subnets"
  type        = list(string)
  default     = []

  validation {
    condition     = alltrue([for cidr in var.redshift_subnets : can(cidrhost(cidr, 0))])
    error_message = "Must all be valid IPv4 CIDRs."
  }
}

variable "elasticache_subnets" {
  description = "A list of elasticache subnets"
  type        = list(string)
  default     = []

  validation {
    condition     = alltrue([for cidr in var.elasticache_subnets : can(cidrhost(cidr, 0))])
    error_message = "Must all be valid IPv4 CIDRs."
  }
}

variable "intra_subnets" {
  description = "A list of intra subnets"
  type        = list(string)
  default     = []

  validation {
    condition     = alltrue([for cidr in var.intra_subnets : can(cidrhost(cidr, 0))])
    error_message = "Must all be valid IPv4 CIDRs."
  }
}

variable "create_database_subnet_route_table" {
  description = "Controls if separate route table for database should be created"
  type        = bool
  default     = false
}

variable "create_redshift_subnet_route_table" {
  description = "Controls if separate route table for redshift should be created"
  type        = bool
  default     = false
}

variable "enable_public_redshift" {
  description = "Controls if redshift should have public routing table"
  type        = bool
  default     = false
}

variable "create_elasticache_subnet_route_table" {
  description = "Controls if separate route table for elasticache should be created"
  type        = bool
  default     = false
}

variable "create_database_subnet_group" {
  description = "Controls if database subnet group should be created (n.b. database_subnets must also be set)"
  type        = bool
  default     = true
}

variable "create_elasticache_subnet_group" {
  description = "Controls if elasticache subnet group should be created"
  type        = bool
  default     = true
}

variable "create_redshift_subnet_group" {
  description = "Controls if redshift subnet group should be created"
  type        = bool
  default     = true
}

variable "create_database_internet_gateway_route" {
  description = "Controls if an internet gateway route for public database access should be created"
  type        = bool
  default     = false
}

variable "create_database_nat_gateway_route" {
  description = "Controls if a nat gateway route should be created to give internet access to the database subnets"
  type        = bool
  default     = false
}

variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = []
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = false
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

# tflint-ignore: terraform_unused_declarations
variable "enable_classiclink" {
  description = "[DEPRECATED](https://github.com/hashicorp/terraform/issues/31730) Should be true to enable ClassicLink for the VPC. Only valid in regions and accounts that support EC2 Classic."
  type        = bool
  default     = null
}

# tflint-ignore: terraform_unused_declarations
variable "enable_classiclink_dns_support" {
  description = "[DEPRECATED](https://github.com/hashicorp/terraform/issues/31730) Should be true to enable ClassicLink DNS Support for the VPC. Only valid in regions and accounts that support EC2 Classic."
  type        = bool
  default     = null
}

variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  type        = bool
  default     = false
}

variable "nat_gateway_destination_cidr_block" {
  description = "Used to pass a custom destination route for private NAT Gateway. If not specified, the default 0.0.0.0/0 is used as a destination route."
  type        = string
  default     = "0.0.0.0/0"

  validation {
    condition     = can(cidrhost(var.nat_gateway_destination_cidr_block, 0))
    error_message = "Must be valid IPv4 CIDR."
  }
}

variable "single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  type        = bool
  default     = false
}

variable "one_nat_gateway_per_az" {
  description = "Should be true if you want only one NAT Gateway per availability zone. Requires `var.azs` to be set, and the number of `public_subnets` created to be greater than or equal to the number of availability zones specified in `var.azs`."
  type        = bool
  default     = false
}

variable "reuse_nat_ips" {
  description = "Should be true if you don't want EIPs to be created for your NAT Gateways and will instead pass them in via the 'external_nat_ip_ids' variable"
  type        = bool
  default     = false
}

variable "external_nat_ip_ids" {
  description = "List of EIP IDs to be assigned to the NAT Gateways (used in combination with reuse_nat_ips)"
  type        = list(string)
  default     = []
}

variable "external_nat_ips" {
  description = "List of EIPs to be used for `nat_public_ips` output (used in combination with reuse_nat_ips and external_nat_ip_ids)"
  type        = list(string)
  default     = []

  validation {
    condition     = alltrue([for ip in var.external_nat_ips : can(cidrhost("${ip}/0", 0))])
    error_message = "Must all be valid IPv4 IPs."
  }
}

variable "map_public_ip_on_launch" {
  description = "Should be false if you do not want to auto-assign public IP on launch"
  type        = bool
  default     = true
}

variable "customer_gateways" {
  description = "Maps of Customer Gateway's attributes (BGP ASN and Gateway's Internet-routable external IP address)"
  type = map(
    object({
      bgp_asn     = number
      ip_address  = string
      device_name = optional(string)
    })
  )
  default = {}

  validation {
    condition     = alltrue([for gateway in var.customer_gateways : can(cidrhost("${gateway.ip_address}/0", 0))])
    error_message = "The values for ip_address must all be valid IPv4 IPs."
  }
}

variable "enable_vpn_gateway" {
  description = "Should be true if you want to create a new VPN Gateway resource and attach it to the VPC"
  type        = bool
  default     = false
}

variable "vpn_gateway_id" {
  description = "ID of VPN Gateway to attach to the VPC"
  type        = string
  default     = ""
}

variable "amazon_side_asn" {
  description = "The Autonomous System Number (ASN) for the Amazon side of the gateway. By default the virtual private gateway is created with the current default Amazon ASN."
  type        = string
  default     = "64512"
}

variable "vpn_gateway_az" {
  description = "The Availability Zone for the VPN Gateway"
  type        = string
  default     = null
}

variable "propagate_intra_route_tables_vgw" {
  description = "Should be true if you want route table propagation"
  type        = bool
  default     = false
}

variable "propagate_private_route_tables_vgw" {
  description = "Should be true if you want route table propagation"
  type        = bool
  default     = false
}

variable "propagate_public_route_tables_vgw" {
  description = "Should be true if you want route table propagation"
  type        = bool
  default     = false
}

variable "manage_default_route_table" {
  description = "Should be true to manage default route table"
  type        = bool
  default     = false
}

variable "default_route_table_name" {
  description = "Name to be used on the default route table"
  type        = string
  default     = null
}

variable "default_route_table_propagating_vgws" {
  description = "List of virtual gateways for propagation"
  type        = list(string)
  default     = []
}

variable "default_route_table_routes" {
  description = "Configuration block of routes. See https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_route_table#route"
  type = list(object({
    cidr_block                = string
    ipv6_cidr_block           = string
    egress_only_gateway_id    = string
    gateway_id                = string
    instance_id               = string
    nat_gateway_id            = string
    network_interface_id      = string
    transit_gateway_id        = string
    vpc_endpoint_id           = string
    vpc_peering_connection_id = string
  }))
  default = []

  validation {
    condition     = alltrue([for route in var.default_route_table_routes : can(cidrhost(route.cidr_block, 0))])
    error_message = "The values for cidr_block must all be valid IPv4 CIDRs."
  }
  validation {
    condition     = alltrue([for route in var.default_route_table_routes : can(cidrhost(route.ipv6_cidr_block, 0))])
    error_message = "The values for ipv6_cidr_block must all be valid IPv6 CIDRs."
  }
}

variable "default_route_table_tags" {
  description = "Additional tags for the default route table"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "vpc_tags" {
  description = "Additional tags for the VPC"
  type        = map(string)
  default     = {}
}

variable "igw_tags" {
  description = "Additional tags for the internet gateway"
  type        = map(string)
  default     = {}
}

variable "public_subnet_tags" {
  description = "Additional tags for the public subnets"
  type        = map(string)
  default     = {}
}

variable "private_subnet_tags" {
  description = "Additional tags for the private subnets"
  type        = map(string)
  default     = {}
}

variable "outpost_subnet_tags" {
  description = "Additional tags for the outpost subnets"
  type        = map(string)
  default     = {}
}

variable "public_route_table_tags" {
  description = "Additional tags for the public route tables"
  type        = map(string)
  default     = {}
}

variable "private_route_table_tags" {
  description = "Additional tags for the private route tables"
  type        = map(string)
  default     = {}
}

variable "database_route_table_tags" {
  description = "Additional tags for the database route tables"
  type        = map(string)
  default     = {}
}

variable "redshift_route_table_tags" {
  description = "Additional tags for the redshift route tables"
  type        = map(string)
  default     = {}
}

variable "elasticache_route_table_tags" {
  description = "Additional tags for the elasticache route tables"
  type        = map(string)
  default     = {}
}

variable "intra_route_table_tags" {
  description = "Additional tags for the intra route tables"
  type        = map(string)
  default     = {}
}

variable "database_subnet_group_name" {
  description = "Name of database subnet group"
  type        = string
  default     = null
}

variable "database_subnet_tags" {
  description = "Additional tags for the database subnets"
  type        = map(string)
  default     = {}
}

variable "database_subnet_group_tags" {
  description = "Additional tags for the database subnet group"
  type        = map(string)
  default     = {}
}

variable "redshift_subnet_tags" {
  description = "Additional tags for the redshift subnets"
  type        = map(string)
  default     = {}
}

variable "redshift_subnet_group_name" {
  description = "Name of redshift subnet group"
  type        = string
  default     = null
}

variable "redshift_subnet_group_tags" {
  description = "Additional tags for the redshift subnet group"
  type        = map(string)
  default     = {}
}

variable "elasticache_subnet_group_name" {
  description = "Name of elasticache subnet group"
  type        = string
  default     = null
}

variable "elasticache_subnet_group_tags" {
  description = "Additional tags for the elasticache subnet group"
  type        = map(string)
  default     = {}
}

variable "elasticache_subnet_tags" {
  description = "Additional tags for the elasticache subnets"
  type        = map(string)
  default     = {}
}

variable "intra_subnet_tags" {
  description = "Additional tags for the intra subnets"
  type        = map(string)
  default     = {}
}

variable "public_acl_tags" {
  description = "Additional tags for the public subnets network ACL"
  type        = map(string)
  default     = {}
}

variable "private_acl_tags" {
  description = "Additional tags for the private subnets network ACL"
  type        = map(string)
  default     = {}
}

variable "outpost_acl_tags" {
  description = "Additional tags for the outpost subnets network ACL"
  type        = map(string)
  default     = {}
}

variable "intra_acl_tags" {
  description = "Additional tags for the intra subnets network ACL"
  type        = map(string)
  default     = {}
}

variable "database_acl_tags" {
  description = "Additional tags for the database subnets network ACL"
  type        = map(string)
  default     = {}
}

variable "redshift_acl_tags" {
  description = "Additional tags for the redshift subnets network ACL"
  type        = map(string)
  default     = {}
}

variable "elasticache_acl_tags" {
  description = "Additional tags for the elasticache subnets network ACL"
  type        = map(string)
  default     = {}
}

variable "dhcp_options_tags" {
  description = "Additional tags for the DHCP option set (requires enable_dhcp_options set to true)"
  type        = map(string)
  default     = {}
}

variable "nat_gateway_tags" {
  description = "Additional tags for the NAT gateways"
  type        = map(string)
  default     = {}
}

variable "nat_eip_tags" {
  description = "Additional tags for the NAT EIP"
  type        = map(string)
  default     = {}
}

variable "customer_gateway_tags" {
  description = "Additional tags for the Customer Gateway"
  type        = map(string)
  default     = {}
}

variable "vpn_gateway_tags" {
  description = "Additional tags for the VPN gateway"
  type        = map(string)
  default     = {}
}

variable "vpc_flow_log_tags" {
  description = "Additional tags for the VPC Flow Logs"
  type        = map(string)
  default     = {}
}

variable "vpc_flow_log_permissions_boundary" {
  description = "The ARN of the Permissions Boundary for the VPC Flow Log IAM Role"
  type        = string
  default     = null
}

variable "enable_dhcp_options" {
  description = "Should be true if you want to specify a DHCP options set with a custom domain name, DNS servers, NTP servers, netbios servers, and/or netbios server type"
  type        = bool
  default     = false
}

variable "dhcp_options_domain_name" {
  description = "Specifies DNS name for DHCP options set (requires enable_dhcp_options set to true)"
  type        = string
  default     = ""
}

variable "dhcp_options_domain_name_servers" {
  description = "Specify a list of DNS server addresses for DHCP options set, default to AWS provided (requires enable_dhcp_options set to true)"
  type        = list(string)
  default     = ["AmazonProvidedDNS"]
}

variable "dhcp_options_ntp_servers" {
  description = "Specify a list of NTP servers for DHCP options set (requires enable_dhcp_options set to true)"
  type        = list(string)
  default     = []

  validation {
    condition     = alltrue([for server in var.dhcp_options_ntp_servers : can(cidrhost("${server}/32", 0))])
    error_message = "Each of the ntp server must all be valid IPv4."
  }
}

variable "dhcp_options_netbios_name_servers" {
  description = "Specify a list of netbios servers for DHCP options set (requires enable_dhcp_options set to true)"
  type        = list(string)
  default     = []

  validation {
    condition     = alltrue([for server in var.dhcp_options_netbios_name_servers : can(cidrhost("${server}/32", 0))])
    error_message = "Each of the netbios server must all be valid IPv4."
  }
}

variable "dhcp_options_netbios_node_type" {
  description = "Specify netbios node_type for DHCP options set (requires enable_dhcp_options set to true)"
  type        = number
  default     = null

  validation {
    condition     = contains(["null", 1, 2, 4, 8], coalesce(var.dhcp_options_netbios_node_type, "null"))
    error_message = "NetBIOS node type must be 1, 2, 4, or 8."
  }
}

variable "manage_default_vpc" {
  description = "Should be true to adopt and manage Default VPC"
  type        = bool
  default     = false
}

variable "default_vpc_name" {
  description = "Name to be used on the Default VPC"
  type        = string
  default     = null
}

variable "default_vpc_enable_dns_support" {
  description = "Should be true to enable DNS support in the Default VPC"
  type        = bool
  default     = true
}

variable "default_vpc_enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the Default VPC"
  type        = bool
  default     = false
}

# tflint-ignore: terraform_unused_declarations
variable "default_vpc_enable_classiclink" {
  description = "[DEPRECATED](https://github.com/hashicorp/terraform/issues/31730) Should be true to enable ClassicLink in the Default VPC"
  type        = bool
  default     = false
}

variable "default_vpc_tags" {
  description = "Additional tags for the Default VPC"
  type        = map(string)
  default     = {}
}

variable "manage_default_network_acl" {
  description = "Should be true to adopt and manage Default Network ACL"
  type        = bool
  default     = false
}

variable "default_network_acl_name" {
  description = "Name to be used on the Default Network ACL"
  type        = string
  default     = null
}

variable "default_network_acl_tags" {
  description = "Additional tags for the Default Network ACL"
  type        = map(string)
  default     = {}
}

variable "public_dedicated_network_acl" {
  description = "Whether to use dedicated network ACL (not default) and custom rules for public subnets"
  type        = bool
  default     = false
}

variable "private_dedicated_network_acl" {
  description = "Whether to use dedicated network ACL (not default) and custom rules for private subnets"
  type        = bool
  default     = false
}

variable "outpost_dedicated_network_acl" {
  description = "Whether to use dedicated network ACL (not default) and custom rules for outpost subnets"
  type        = bool
  default     = false
}

variable "intra_dedicated_network_acl" {
  description = "Whether to use dedicated network ACL (not default) and custom rules for intra subnets"
  type        = bool
  default     = false
}

variable "database_dedicated_network_acl" {
  description = "Whether to use dedicated network ACL (not default) and custom rules for database subnets"
  type        = bool
  default     = false
}

variable "redshift_dedicated_network_acl" {
  description = "Whether to use dedicated network ACL (not default) and custom rules for redshift subnets"
  type        = bool
  default     = false
}

variable "elasticache_dedicated_network_acl" {
  description = "Whether to use dedicated network ACL (not default) and custom rules for elasticache subnets"
  type        = bool
  default     = false
}

variable "default_network_acl_ingress" {
  description = "List of maps of ingress rules to set on the Default Network ACL"
  type = list(object({
    action          = string
    cidr_block      = optional(string)
    from_port       = number
    icmp_code       = optional(number)
    icmp_type       = optional(number)
    ipv6_cidr_block = optional(string)
    protocol        = any
    rule_no         = number
    to_port         = number
  }))

  default = [
    {
      rule_no    = 100
      action     = "allow"
      from_port  = 0
      to_port    = 0
      protocol   = -1
      cidr_block = "0.0.0.0/0"
    },
    {
      rule_no         = 101
      action          = "allow"
      from_port       = 0
      to_port         = 0
      protocol        = -1
      ipv6_cidr_block = "::/0"
    },
  ]

  validation {
    condition     = alltrue([for rule in var.default_network_acl_ingress : can(cidrhost(rule.cidr_block, 0)) || rule.cidr_block == null])
    error_message = "The values for cidr_block must all be valid IPv4 CIDRs."
  }
  validation {
    condition     = alltrue([for rule in var.default_network_acl_ingress : can(cidrhost(rule.ipv6_cidr_block, 0)) || rule.ipv6_cidr_block == null])
    error_message = "The values for ipv6_cidr_block must all be valid IPv6 CIDRs."
  }

}

variable "default_network_acl_egress" {
  description = "List of maps of egress rules to set on the Default Network ACL"
  type = list(object({
    action          = string
    cidr_block      = optional(string)
    from_port       = number
    icmp_code       = optional(number)
    icmp_type       = optional(number)
    ipv6_cidr_block = optional(string)
    protocol        = any
    rule_no         = number
    to_port         = number
  }))

  default = [
    {
      rule_no    = 100
      action     = "allow"
      from_port  = 0
      to_port    = 0
      protocol   = -1
      cidr_block = "0.0.0.0/0"
    },
    {
      rule_no         = 101
      action          = "allow"
      from_port       = 0
      to_port         = 0
      protocol        = -1
      ipv6_cidr_block = "::/0"
    },
  ]

  validation {
    condition     = alltrue([for rule in var.default_network_acl_egress : can(cidrhost(rule.cidr_block, 0)) || rule.cidr_block == null])
    error_message = "The values for cidr_block must all be valid IPv4 CIDRs."
  }
  validation {
    condition     = alltrue([for rule in var.default_network_acl_egress : can(cidrhost(rule.ipv6_cidr_block, 0)) || rule.ipv6_cidr_block == null])
    error_message = "The values for ipv6_cidr_block must all be valid IPv6 CIDRs."
  }
}

variable "public_inbound_acl_rules" {
  description = "Public subnets inbound network ACLs"
  type = list(object({
    rule_number     = number
    rule_action     = string
    from_port       = optional(number)
    to_port         = optional(number)
    icmp_code       = optional(number)
    icmp_type       = optional(number)
    protocol        = any
    cidr_block      = optional(string)
    ipv6_cidr_block = optional(string)
  }))

  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = -1
      cidr_block  = "0.0.0.0/0"
    },
  ]

  validation {
    condition     = alltrue([for rule in var.public_inbound_acl_rules : can(cidrhost(rule.cidr_block, 0)) || rule.cidr_block == null])
    error_message = "The values for cidr_block must all be valid IPv4 CIDRs."
  }
  validation {
    condition     = alltrue([for rule in var.public_inbound_acl_rules : can(cidrhost(rule.ipv6_cidr_block, 0)) || rule.ipv6_cidr_block == null])
    error_message = "The values for ipv6_cidr_block must all be valid IPv6 CIDRs."
  }
}

variable "public_outbound_acl_rules" {
  description = "Public subnets outbound network ACLs"
  type = list(object({
    rule_number     = number
    rule_action     = string
    from_port       = optional(number)
    to_port         = optional(number)
    icmp_code       = optional(number)
    icmp_type       = optional(number)
    protocol        = any
    cidr_block      = optional(string)
    ipv6_cidr_block = optional(string)
  }))

  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = -1
      cidr_block  = "0.0.0.0/0"
    },
  ]

  validation {
    condition     = alltrue([for rule in var.public_outbound_acl_rules : can(cidrhost(rule.cidr_block, 0)) || rule.cidr_block == null])
    error_message = "The values for cidr_block must all be valid IPv4 CIDRs."
  }
  validation {
    condition     = alltrue([for rule in var.public_outbound_acl_rules : can(cidrhost(rule.ipv6_cidr_block, 0)) || rule.ipv6_cidr_block == null])
    error_message = "The values for ipv6_cidr_block must all be valid IPv6 CIDRs."
  }
}

variable "private_inbound_acl_rules" {
  description = "Private subnets inbound network ACLs"
  type = list(object({
    rule_number     = number
    rule_action     = string
    from_port       = optional(number)
    to_port         = optional(number)
    icmp_code       = optional(number)
    icmp_type       = optional(number)
    protocol        = any
    cidr_block      = optional(string)
    ipv6_cidr_block = optional(string)
  }))

  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = -1
      cidr_block  = "0.0.0.0/0"
    },
  ]

  validation {
    condition     = alltrue([for rule in var.private_inbound_acl_rules : can(cidrhost(rule.cidr_block, 0)) || rule.cidr_block == null])
    error_message = "The values for cidr_block must all be valid IPv4 CIDRs."
  }
  validation {
    condition     = alltrue([for rule in var.private_inbound_acl_rules : can(cidrhost(rule.ipv6_cidr_block, 0)) || rule.ipv6_cidr_block == null])
    error_message = "The values for ipv6_cidr_block must all be valid IPv6 CIDRs."
  }
}

variable "private_outbound_acl_rules" {
  description = "Private subnets outbound network ACLs"
  type = list(object({
    rule_number     = number
    rule_action     = string
    from_port       = optional(number)
    to_port         = optional(number)
    icmp_code       = optional(number)
    icmp_type       = optional(number)
    protocol        = any
    cidr_block      = optional(string)
    ipv6_cidr_block = optional(string)
  }))

  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = -1
      cidr_block  = "0.0.0.0/0"
    },
  ]

  validation {
    condition     = alltrue([for rule in var.private_outbound_acl_rules : can(cidrhost(rule.cidr_block, 0)) || rule.cidr_block == null])
    error_message = "The values for cidr_block must all be valid IPv4 CIDRs."
  }
  validation {
    condition     = alltrue([for rule in var.private_outbound_acl_rules : can(cidrhost(rule.ipv6_cidr_block, 0)) || rule.ipv6_cidr_block == null])
    error_message = "The values for ipv6_cidr_block must all be valid IPv6 CIDRs."
  }
}

variable "outpost_inbound_acl_rules" {
  description = "Outpost subnets inbound network ACLs"
  type = list(object({
    rule_number     = number
    rule_action     = string
    from_port       = optional(number)
    to_port         = optional(number)
    icmp_code       = optional(number)
    icmp_type       = optional(number)
    protocol        = any
    cidr_block      = optional(string)
    ipv6_cidr_block = optional(string)
  }))

  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = -1
      cidr_block  = "0.0.0.0/0"
    },
  ]

  validation {
    condition     = alltrue([for rule in var.outpost_inbound_acl_rules : can(cidrhost(rule.cidr_block, 0)) || rule.cidr_block == null])
    error_message = "The values for cidr_block must all be valid IPv4 CIDRs."
  }
  validation {
    condition     = alltrue([for rule in var.outpost_inbound_acl_rules : can(cidrhost(rule.ipv6_cidr_block, 0)) || rule.ipv6_cidr_block == null])
    error_message = "The values for ipv6_cidr_block must all be valid IPv6 CIDRs."
  }
}

variable "outpost_outbound_acl_rules" {
  description = "Outpost subnets outbound network ACLs"
  type = list(object({
    rule_number     = number
    rule_action     = string
    from_port       = optional(number)
    to_port         = optional(number)
    icmp_code       = optional(number)
    icmp_type       = optional(number)
    protocol        = any
    cidr_block      = optional(string)
    ipv6_cidr_block = optional(string)
  }))

  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = -1
      cidr_block  = "0.0.0.0/0"
    },
  ]

  validation {
    condition     = alltrue([for rule in var.outpost_outbound_acl_rules : can(cidrhost(rule.cidr_block, 0)) || rule.cidr_block == null])
    error_message = "The values for cidr_block must all be valid IPv4 CIDRs."
  }
  validation {
    condition     = alltrue([for rule in var.outpost_outbound_acl_rules : can(cidrhost(rule.ipv6_cidr_block, 0)) || rule.ipv6_cidr_block == null])
    error_message = "The values for ipv6_cidr_block must all be valid IPv6 CIDRs."
  }
}

variable "intra_inbound_acl_rules" {
  description = "Intra subnets inbound network ACLs"
  type = list(object({
    rule_number     = number
    rule_action     = string
    from_port       = optional(number)
    to_port         = optional(number)
    icmp_code       = optional(number)
    icmp_type       = optional(number)
    protocol        = any
    cidr_block      = optional(string)
    ipv6_cidr_block = optional(string)
  }))

  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = -1
      cidr_block  = "0.0.0.0/0"
    },
  ]

  validation {
    condition     = alltrue([for rule in var.intra_inbound_acl_rules : can(cidrhost(rule.cidr_block, 0)) || rule.cidr_block == null])
    error_message = "The values for cidr_block must all be valid IPv4 CIDRs."
  }
  validation {
    condition     = alltrue([for rule in var.intra_inbound_acl_rules : can(cidrhost(rule.ipv6_cidr_block, 0)) || rule.ipv6_cidr_block == null])
    error_message = "The values for ipv6_cidr_block must all be valid IPv6 CIDRs."
  }
}

variable "intra_outbound_acl_rules" {
  description = "Intra subnets outbound network ACLs"
  type = list(object({
    rule_number     = number
    rule_action     = string
    from_port       = optional(number)
    to_port         = optional(number)
    icmp_code       = optional(number)
    icmp_type       = optional(number)
    protocol        = any
    cidr_block      = optional(string)
    ipv6_cidr_block = optional(string)
  }))

  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = -1
      cidr_block  = "0.0.0.0/0"
    },
  ]

  validation {
    condition     = alltrue([for rule in var.intra_outbound_acl_rules : can(cidrhost(rule.cidr_block, 0)) || rule.cidr_block == null])
    error_message = "The values for cidr_block must all be valid IPv4 CIDRs."
  }
  validation {
    condition     = alltrue([for rule in var.intra_outbound_acl_rules : can(cidrhost(rule.ipv6_cidr_block, 0)) || rule.ipv6_cidr_block == null])
    error_message = "The values for ipv6_cidr_block must all be valid IPv6 CIDRs."
  }
}

variable "database_inbound_acl_rules" {
  description = "Database subnets inbound network ACL rules"
  type = list(object({
    rule_number     = number
    rule_action     = string
    from_port       = optional(number)
    to_port         = optional(number)
    icmp_code       = optional(number)
    icmp_type       = optional(number)
    protocol        = any
    cidr_block      = optional(string)
    ipv6_cidr_block = optional(string)
  }))

  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = -1
      cidr_block  = "0.0.0.0/0"
    },
  ]

  validation {
    condition     = alltrue([for rule in var.database_inbound_acl_rules : can(cidrhost(rule.cidr_block, 0)) || rule.cidr_block == null])
    error_message = "The values for cidr_block must all be valid IPv4 CIDRs."
  }
  validation {
    condition     = alltrue([for rule in var.database_inbound_acl_rules : can(cidrhost(rule.ipv6_cidr_block, 0)) || rule.ipv6_cidr_block == null])
    error_message = "The values for ipv6_cidr_block must all be valid IPv6 CIDRs."
  }
}

variable "database_outbound_acl_rules" {
  description = "Database subnets outbound network ACL rules"
  type = list(object({
    rule_number     = number
    rule_action     = string
    from_port       = optional(number)
    to_port         = optional(number)
    icmp_code       = optional(number)
    icmp_type       = optional(number)
    protocol        = any
    cidr_block      = optional(string)
    ipv6_cidr_block = optional(string)
  }))

  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = -1
      cidr_block  = "0.0.0.0/0"
    },
  ]

  validation {
    condition     = alltrue([for rule in var.database_outbound_acl_rules : can(cidrhost(rule.cidr_block, 0)) || rule.cidr_block == null])
    error_message = "The values for cidr_block must all be valid IPv4 CIDRs."
  }
  validation {
    condition     = alltrue([for rule in var.database_outbound_acl_rules : can(cidrhost(rule.ipv6_cidr_block, 0)) || rule.ipv6_cidr_block == null])
    error_message = "The values for ipv6_cidr_block must all be valid IPv6 CIDRs."
  }
}

variable "redshift_inbound_acl_rules" {
  description = "Redshift subnets inbound network ACL rules"
  type = list(object({
    rule_number     = number
    rule_action     = string
    from_port       = optional(number)
    to_port         = optional(number)
    icmp_code       = optional(number)
    icmp_type       = optional(number)
    protocol        = any
    cidr_block      = optional(string)
    ipv6_cidr_block = optional(string)
  }))

  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = -1
      cidr_block  = "0.0.0.0/0"
    },
  ]

  validation {
    condition     = alltrue([for rule in var.redshift_inbound_acl_rules : can(cidrhost(rule.cidr_block, 0)) || rule.cidr_block == null])
    error_message = "The values for cidr_block must all be valid IPv4 CIDRs."
  }
  validation {
    condition     = alltrue([for rule in var.redshift_inbound_acl_rules : can(cidrhost(rule.ipv6_cidr_block, 0)) || rule.ipv6_cidr_block == null])
    error_message = "The values for ipv6_cidr_block must all be valid IPv6 CIDRs."
  }
}

variable "redshift_outbound_acl_rules" {
  description = "Redshift subnets outbound network ACL rules"
  type = list(object({
    rule_number     = number
    rule_action     = string
    from_port       = optional(number)
    to_port         = optional(number)
    icmp_code       = optional(number)
    icmp_type       = optional(number)
    protocol        = any
    cidr_block      = optional(string)
    ipv6_cidr_block = optional(string)
  }))

  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = -1
      cidr_block  = "0.0.0.0/0"
    },
  ]

  validation {
    condition     = alltrue([for rule in var.redshift_outbound_acl_rules : can(cidrhost(rule.cidr_block, 0)) || rule.cidr_block == null])
    error_message = "The values for cidr_block must all be valid IPv4 CIDRs."
  }
  validation {
    condition     = alltrue([for rule in var.redshift_outbound_acl_rules : can(cidrhost(rule.ipv6_cidr_block, 0)) || rule.ipv6_cidr_block == null])
    error_message = "The values for ipv6_cidr_block must all be valid IPv6 CIDRs."
  }
}

variable "elasticache_inbound_acl_rules" {
  description = "Elasticache subnets inbound network ACL rules"
  type = list(object({
    rule_number     = number
    rule_action     = string
    from_port       = optional(number)
    to_port         = optional(number)
    icmp_code       = optional(number)
    icmp_type       = optional(number)
    protocol        = any
    cidr_block      = optional(string)
    ipv6_cidr_block = optional(string)
  }))

  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = -1
      cidr_block  = "0.0.0.0/0"
    },
  ]

  validation {
    condition     = alltrue([for rule in var.elasticache_inbound_acl_rules : can(cidrhost(rule.cidr_block, 0)) || rule.cidr_block == null])
    error_message = "The values for cidr_block must all be valid IPv4 CIDRs."
  }
  validation {
    condition     = alltrue([for rule in var.elasticache_inbound_acl_rules : can(cidrhost(rule.ipv6_cidr_block, 0)) || rule.ipv6_cidr_block == null])
    error_message = "The values for ipv6_cidr_block must all be valid IPv6 CIDRs."
  }
}

variable "elasticache_outbound_acl_rules" {
  description = "Elasticache subnets outbound network ACL rules"
  type = list(object({
    rule_number     = number
    rule_action     = string
    from_port       = optional(number)
    to_port         = optional(number)
    icmp_code       = optional(number)
    icmp_type       = optional(number)
    protocol        = any
    cidr_block      = optional(string)
    ipv6_cidr_block = optional(string)
  }))

  default = [
    {
      rule_number = 100
      rule_action = "allow"
      from_port   = 0
      to_port     = 0
      protocol    = -1
      cidr_block  = "0.0.0.0/0"
    },
  ]

  validation {
    condition     = alltrue([for rule in var.elasticache_outbound_acl_rules : can(cidrhost(rule.cidr_block, 0)) || rule.cidr_block == null])
    error_message = "The values for cidr_block must all be valid IPv4 CIDRs."
  }
  validation {
    condition     = alltrue([for rule in var.elasticache_outbound_acl_rules : can(cidrhost(rule.ipv6_cidr_block, 0)) || rule.ipv6_cidr_block == null])
    error_message = "The values for ipv6_cidr_block must all be valid IPv6 CIDRs."
  }
}

variable "manage_default_security_group" {
  description = "Should be true to adopt and manage default security group"
  type        = bool
  default     = false
}

variable "default_security_group_name" {
  description = "Name to be used on the default security group"
  type        = string
  default     = null
}

variable "default_security_group_ingress" {
  description = "List of maps of ingress rules to set on the default security group"
  type = list(object({
    cidr_blocks      = optional(string, "")
    ipv6_cidr_blocks = optional(string, "")
    prefix_list_ids  = optional(string, "")
    security_groups  = optional(string, "")
    description      = optional(string)
    from_port        = optional(number, 0)
    to_port          = optional(number, 0)
    protocol         = optional(number, -1)
  }))
  default = []

  validation {
    condition     = alltrue([for rule in var.default_security_group_ingress : can(cidrhost(rule.cidr_blocks, 0)) || rule.cidr_block == null])
    error_message = "The values for cidr_blocks must all be valid IPv4 CIDRs."
  }
  validation {
    condition     = alltrue([for rule in var.default_security_group_ingress : can(cidrhost(rule.ipv6_cidr_blocks, 0)) || rule.ipv6_cidr_blocks == null])
    error_message = "The values for ipv6_cidr_blocks must all be valid IPv6 CIDRs."
  }
}

variable "enable_flow_log" {
  description = "Whether or not to enable VPC Flow Logs"
  type        = bool
  default     = false
}

variable "default_security_group_egress" {
  description = "List of maps of egress rules to set on the default security group"
  type = list(object({
    cidr_blocks      = optional(string, "")
    ipv6_cidr_blocks = optional(string, "")
    prefix_list_ids  = optional(string, "")
    security_groups  = optional(string, "")
    description      = optional(string)
    from_port        = optional(number, 0)
    to_port          = optional(number, 0)
    protocol         = optional(number, -1)
  }))
  default = []

  validation {
    condition     = alltrue([for rule in var.default_security_group_egress : can(cidrhost(rule.cidr_blocks, 0)) || rule.cidr_block == null])
    error_message = "The values for cidr_blocks must all be valid IPv4 CIDRs."
  }
  validation {
    condition     = alltrue([for rule in var.default_security_group_egress : can(cidrhost(rule.ipv6_cidr_blocks, 0)) || rule.ipv6_cidr_blocks == null])
    error_message = "The values for ipv6_cidr_blocks must all be valid IPv6 CIDRs."
  }
}

variable "default_security_group_tags" {
  description = "Additional tags for the default security group"
  type        = map(string)
  default     = {}
}

variable "create_flow_log_cloudwatch_log_group" {
  description = "Whether to create CloudWatch log group for VPC Flow Logs"
  type        = bool
  default     = false
}

variable "create_flow_log_cloudwatch_iam_role" {
  description = "Whether to create IAM role for VPC Flow Logs"
  type        = bool
  default     = false
}

variable "flow_log_traffic_type" {
  description = "The type of traffic to capture. Valid values: ACCEPT, REJECT, ALL."
  type        = string
  default     = "ALL"

  validation {
    condition     = contains(["ACCEPT", "REJECT", "ALL"], var.flow_log_traffic_type)
    error_message = "The valid values for flow_log_traffic_type are: ACCEPT, REJECT, ALL."
  }
}

variable "flow_log_destination_type" {
  description = "Type of flow log destination. Can be s3 or cloud-watch-logs."
  type        = string
  default     = "cloud-watch-logs"

  validation {
    condition     = contains(["cloud-watch-logs", "s3"], var.flow_log_destination_type)
    error_message = "The valid values for flow_log_destination_type are: s3, cloud-watch-logs."
  }
}

variable "flow_log_log_format" {
  description = "The fields to include in the flow log record, in the order in which they should appear."
  type        = string
  default     = null
}

variable "flow_log_destination_arn" {
  description = "The ARN of the CloudWatch log group or S3 bucket where VPC Flow Logs will be pushed. If this ARN is a S3 bucket the appropriate permissions need to be set on that bucket's policy. When create_flow_log_cloudwatch_log_group is set to false this argument must be provided."
  type        = string
  default     = ""
}

variable "flow_log_cloudwatch_iam_role_arn" {
  description = "The ARN for the IAM role that's used to post flow logs to a CloudWatch Logs log group. When flow_log_destination_arn is set to ARN of Cloudwatch Logs, this argument needs to be provided."
  type        = string
  default     = ""
}

variable "flow_log_cloudwatch_log_group_name_prefix" {
  description = "Specifies the name prefix of CloudWatch Log Group for VPC flow logs."
  type        = string
  default     = "/aws/vpc-flow-log/"
}

variable "flow_log_cloudwatch_log_group_retention_in_days" {
  description = "Specifies the number of days you want to retain log events in the specified log group for VPC flow logs."
  type        = number
  default     = null

  validation {
    condition     = contains(["null", 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, 3653, 0], coalesce(var.flow_log_cloudwatch_log_group_retention_in_days, "null"))
    error_message = "The values for flow_log_cloudwatch_log_group_retention_in_days are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, 3653, 0."
  }

}

variable "flow_log_cloudwatch_log_group_kms_key_id" {
  description = "The ARN of the KMS Key to use when encrypting log data for VPC flow logs."
  type        = string
  default     = null
}

variable "flow_log_max_aggregation_interval" {
  description = "The maximum interval of time during which a flow of packets is captured and aggregated into a flow log record. Valid Values: `60` seconds or `600` seconds."
  type        = number
  default     = 600

  validation {
    condition     = contains([60, 600], var.flow_log_max_aggregation_interval)
    error_message = "The values for flow_log_max_aggregation_interval must be 60 or 600."
  }
}

variable "create_igw" {
  description = "Controls if an Internet Gateway is created for public subnets and the related routes that connect them."
  type        = bool
  default     = true
}

variable "create_egress_only_igw" {
  description = "Controls if an Egress Only Internet Gateway is created and its related routes."
  type        = bool
  default     = true
}

variable "outpost_arn" {
  description = "ARN of Outpost you want to create a subnet in."
  type        = string
  default     = null
}

variable "outpost_az" {
  description = "AZ where Outpost is anchored."
  type        = string
  default     = null
}

variable "flow_log_file_format" {
  description = "(Optional) The format for the flow log. Valid values: `plain-text`, `parquet`."
  type        = string
  default     = "plain-text"

  validation {
    condition     = contains(["plain-text", "parquet"], var.flow_log_file_format)
    error_message = "ERROR valid values: plain-text, parquet."
  }
}

variable "flow_log_hive_compatible_partitions" {
  description = "(Optional) Indicates whether to use Hive-compatible prefixes for flow logs stored in Amazon S3."
  type        = bool
  default     = false
}

variable "flow_log_per_hour_partition" {
  description = "(Optional) Indicates whether to partition the flow log per hour. This reduces the cost and response time for queries."
  type        = bool
  default     = false
}

variable "putin_khuylo" {
  description = "Do you agree that Putin doesn't respect Ukrainian sovereignty and territorial integrity? More info: https://en.wikipedia.org/wiki/Putin_khuylo!"
  type        = bool
  default     = true
}
