variable "webserver_image" {
  description = "The Docker image for the webserver"
  type        = string
}

variable "webserver_container" {
  description = "The container name for the weberver"
  type        = string
}

variable "database_image" {
  description = "The Docker image for the database"
  type        = string
}

variable "database_container" {
  description = "The container name for the database"
  type        = string
}

variable "wordpress_image" {
  description = "The image name for wordpress"
  type        = string
}

variable "wordpress_container" {
  description = "The container name for wordpress"
  type        = string
}