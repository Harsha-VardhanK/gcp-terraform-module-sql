output "instance_name" {
  description = "Cloud SQL instance name"
  value       = google_sql_database_instance.this.name
}

output "private_ip" {
  description = "Private IP address of Cloud SQL"
  value       = google_sql_database_instance.this.private_ip_address
}

output "connection_name" {
  description = "Cloud SQL connection name"
  value       = google_sql_database_instance.this.connection_name
}
