/**
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "name" {
  type        = string
  description = "The name of the interconnect attachment"
}

variable "project" {
  type        = string
  description = "The project ID to deploy to"
}

variable "router" {
  type        = string
  description = "Name of the router the attachment resides"
}

variable "region" {
  type        = string
  description = "Region where the attachment resides"
}

variable "interconnect" {
  type        = string
  description = "URL of the underlying Interconnect object that this attachment's traffic will traverse through."
}

variable "admin_enabled" {
  type        = bool
  description = "Whether the VLAN attachment is enabled or disabled"
  default     = true
}

variable "type" {
  type        = string
  description = "The type of InterconnectAttachment you wish to create"
  default     = "DEDICATED"
}

variable "bandwidth" {
  type        = string
  description = "Provisioned bandwidth capacity for the interconnect attachment"
  default     = "BPS_10G"
}

variable "mtu" {
  type        = string
  description = "Maximum Transmission Unit (MTU), in bytes, of packets passing through this interconnect attachment. Currently, only 1440 and 1500 are allowed. If not specified, the value will default to 1440."
  default     = null
}

variable "description" {
  type        = string
  description = "An optional description of this resource"
  default     = null
}

variable "candidate_subnets" {
  type        = list(string)
  description = "Up to 16 candidate prefixes that can be used to restrict the allocation of cloudRouterIpAddress and customerRouterIpAddress for this attachment. All prefixes must be within link-local address space (169.254.0.0/16) and must be /29 or shorter (/28, /27, etc)."
  default     = null
}

variable "vlan_tag8021q" {
  type        = string
  description = "The IEEE 802.1Q VLAN tag for this attachment, in the range 2-4094."
  default     = null
}

# TODO(https://github.com/hashicorp/terraform/issues/19898): Convert these
# to objects once optional variables are supported.

# Type: object, with fields:
# - name (string, required): The name of the interface
variable "interface" {
  description = "Interface to deploy for this attachment."
  type        = any
}

# Type: object, with fields:
# - peer_asn (string, required): Peer BGP Autonomous System Number (ASN).
# - advertised_route_priority (number, optional): The priority of routes advertised to this BGP peer.
# - bfd (object, optional): BFD Session configuration for this beer. BFD Block supports:
#   - session_initialization_mode (string, required): he BFD session initialization mode for this BGP peer.
#   - min_transmit_interval (num, optional):  The minimum interval, in milliseconds, between BFD control packets transmitted to the peer router.
#   - min_receive_interval (num, optional): The minimum interval, in milliseconds, between BFD control packets received from the peer router.
#   - multiplier (num, optional): The number of consecutive BFD packets that must be missed before BFD declares that a peer is unavailable.
variable "peer" {
  description = "BGP Peer for this attachment."
  type        = any
}
