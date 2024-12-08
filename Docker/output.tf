output "wordpress_image_id" {
  description = "ID of the docker image"
  value       = docker_image.wordpress.id
}

output "webserver_image_id" {
  description = "ID of the docker image"
  value       = docker_image.nginx.id
}

output "database_image_id" {
  description = "ID of the docker image"
  value       = docker_image.mariadb.id
}

output "webserver_container_id" {
  description = "ID of the container"
  value       = docker_container.nginx.id
}


output "wordpress_container_id" {
  description = "ID of the container"
  value       = docker_container.wordpress.id
}


output "database_container_id" {
  description = "ID of the container"
  value       = docker_container.mariadb.id
}




