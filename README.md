Terraform Cloud SQL Module (Google Cloud)

This Terraform module provisions a Google Cloud SQL instance on Google Cloud Platform with private IP connectivity.
It is designed to be shttps://github.com/Harsha-VardhanK/gcp-terraform-module-sql/tree/mainecure by default, reusable across multiple projects, and suitable for production environments.

The module supports creating:

A Cloud SQL instance

An initial database

A database user

This module is intended to be used with an existing VPC network configured for Private Service Access (PSA).

Features

Create Cloud SQL instances (PostgreSQL or MySQL)

Private IP connectivity (recommended for production)

Create initial database and user

Secure by default (no public IP)

Multi-project and CI/CD friendly

Registry-style module structure

Requirements
Name	Version
Terraform	>= 1.5.0
Google Provider	~> 6.0
Prerequisites

Before using this module, ensure:

Private Service Access (PSA) is configured in the target VPC

servicenetworking.googleapis.com is enabled

A reserved IP range exists for Cloud SQL

PSA is typically created in a networking module and shared across services.

Inputs
Required Inputs
Name	Description	Type
project_id	GCP project ID	string
region	GCP region	string
instance_name	Cloud SQL instance name	string
private_network	VPC network self-link	string
database_name	Initial database name	string
db_user	Database user name	string
db_password	Database user password	string (sensitive)
Optional Inputs
Name	Description	Type	Default
database_version	Database engine & version	string	POSTGRES_15
tier	Instance machine tier	string	db-custom-2-7680
Outputs
Name	Description
instance_name	Cloud SQL instance name
private_ip	Private IP address of Cloud SQL
connection_name	Cloud SQL connection name
Example Usage
module "cloudsql" {
  source = "git::https://github.com/Harsha-VardhanK/gcp-terraform-module-cloudsql.git?ref=v1.0.0"

  project_id      = "my-sample-project"
  region          = "us-central1"
  instance_name   = "demo-sql"
  private_network = module.networking.vpcs["main"]

  database_name = "appdb"
  db_user       = "appuser"
  db_password   = "StrongPassword123!"
}

Security Notes

Public IP is disabled by default

Access is restricted to resources in the same VPC

Use Secret Manager or CI/CD secret injection for database passwords

Avoid storing plaintext passwords in Git
