resource "google_sql_database_instance" "this" {
  project          = var.project_id
  name             = var.instance_name
  region           = var.region
  database_version = var.database_version

  settings {
    tier = var.tier

    ip_configuration {
      ipv4_enabled    = false
      private_network = var.private_network
    }

    backup_configuration {
      enabled = true
    }
  }

  deletion_protection = false
}

resource "google_sql_database" "db" {
  name     = var.database_name
  instance = google_sql_database_instance.this.name
  project  = var.project_id
}

resource "google_sql_user" "user" {
  name     = var.db_user
  instance = google_sql_database_instance.this.name
  project  = var.project_id
  password = var.db_password
}

#updated git hub module