variable "prefix" {}

variable "project_id" {}

variable "region" {
  description = "Google Region to create the resources"
  default     = "us-west2"

  validation {
    condition = contains([
      "asia-east1",
      "asia-east2",
      "asia-northeast1",
      "asia-northeast2",
      "asia-northeast3",
      "asia-south1",
      "asia-south2",
      "asia-southeast1",
      "asia-southeast2",
      "australia-southeast1",
      "australia-southeast2",
      "europe-central2",
      "europe-north1",
      "europe-southwest1",
      "europe-west1",
      "europe-west10",
      "europe-west12",
      "europe-west2",
      "europe-west3",
      "europe-west4",
      "europe-west6",
      "europe-west8",
      "europe-west9",
      "me-central1",
      "me-central2",
      "me-west1",
      "northamerica-northeast1",
      "northamerica-northeast2",
      "southamerica-east1",
      "southamerica-west1",
      "us-central1",
      "us-east1",
      "us-east4",
      "us-east5",
      "us-south1",
      "us-west1",
      "us-west2",
      "us-west3",
      "us-west4",
    ], var.region)
    error_message = "Invalid Region specified!"
  }
}

# variable "create_ssh_key_pair" {
#   description = "Specify if a new SSH key pair needs to be created for the instances"
#   default     = true
# }

variable "ssh_private_key_path" {
  description = "The full path where is present the pre-generated SSH PRIVATE key (not generated by Terraform); if `create_ssh_key_pair = false` this variable must be set"
  default     = null
}

variable "ssh_public_key_path" {
  default = null
}

# variable "ip_cidr_range" {}

variable "vpc" {
  default = null
}

variable "subnet" {
  default = null
}

variable "create_firewall" {
  default = null
}

variable "server_instance_count" {
  description = "The number of Server nodes"
  default     = 3

  validation {
    condition = contains([
      1,
      3,
      5,
    ], var.server_instance_count)
    error_message = "Invalid number of Server nodes specified! The value must be 1, 3 or 5 (ETCD quorum)."
  }
}

variable "worker_instance_count" {}

# variable "instance_disk_size" {}

# variable "disk_type" {}

# variable "instance_type" {}

# variable "os_image" {}

variable "ssh_username" {}

# variable "startup_script" {}

variable "waiting_time" {
  description = "Waiting time (in seconds)"
  default     = 180
}

variable "k3s_version" {
  type        = string
  description = "Kubernetes version to use for the K3s cluster"
  default     = "v1.26.12+k3s1" #Version compatible with Rancher v2.7.9
}

variable "k3s_channel" {
  type        = string
  description = "K3s channel to use, the latest patch version for the provided minor version will be used"
  default     = null
}


variable "k3s_token" {
  description = "Token to use when configuring K3s nodes"
  default     = null
}

variable "k3s_config" {
  description = "Additional K3s configuration to add to the config.yaml file"
  default     = null
}

variable "kube_config_path" {
  description = "The path to write the kubeconfig for the K3s cluster"
  type        = string
  default     = null
}

variable "kube_config_filename" {
  description = "Filename to write the kube config"
  type        = string
  default     = null
}

variable "bootstrap_rancher" {
  description = "Bootstrap the Rancher installation"
  type        = bool
  default     = true
}

variable "rancher_hostname" {}

variable "rancher_password" {
  type = string

  validation {
    condition     = length(var.rancher_password) >= 12
    error_message = "The password must be at least 12 characters."
  }
}

variable "rancher_version" {
  description = "Rancher version to install"
  type        = string
  default     = null
}

variable "rancher_ingress_class_name" {
  description = "Rancher ingressClassName value"
  default     = "traefik"
}

variable "rancher_service_type" {
  description = "Rancher serviceType value"
  default     = "ClusterIP"
}
