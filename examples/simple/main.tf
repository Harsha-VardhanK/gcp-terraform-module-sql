provider "google" {
  project = "my-sample-project"
  region  = "us-central1"
}

module "networking" {
  source = "git::https://github.com/Harsha-VardhanK/gcp-terraform-module-network.git?ref=v1.0.0"

  project_id = "my-sample-project"
  region     = "us-central1"

  vpcs = {
    main = { name = "main-vpc" }
  }

  subnets = {
    db = {
      vpc_key   = "main"
      name      = "db-subnet"
      region    = "us-central1"
      cidr      = "10.50.0.0/24"
      secondary = {}
    }
  }

  enable_nat = true
}

module "cloudsql" {
  source = "../../"

  project_id       = "my-sample-project"
  region           = "us-central1"
  instance_name    = "demo-sql"
  private_network  = module.networking.vpcs["main"]

  database_name = "appdb"
  db_user       = "appuser"
  db_password   = "StrongPassword123!"
}
