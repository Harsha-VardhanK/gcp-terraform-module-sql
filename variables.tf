variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "instance_name" {
  description = "Cloud SQL instance name"
  type        = string
}

variable "database_version" {
  description = "Database engine and version"
  type        = string
  default     = "POSTGRES_15"
}

variable "tier" {
  description = "Machine tier"
  type        = string
  default     = "db-custom-2-7680"
}

variable "private_network" {
  description = "VPC self-link for private IP"
  type        = string
}

variable "database_name" {
  description = "Initial database name"
  type        = string
}

variable "db_user" {
  description = "Database user name"
  type        = string
}

variable "db_password" {
  description = "Database user password"
  type        = string
  sensitive   = true
}
