terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "nginx" {
  name         = var.webserver_image
  keep_locally = true

  # build {
  #   context    = "/mnt/d/Terraform/Docker/dockerfiles/nginx/" 
  #   dockerfile = "Dockerfile"                      
  # }
}

resource "docker_image" "mariadb" {
  name         = var.database_image
  keep_locally = true

  # build {
  #   context    = "/mnt/d/Terraform/Docker/dockerfiles/mariadb/" 
  #   dockerfile = "Dockerfile"                        
  # }
}

resource "docker_image" "wordpress" {
  name         = var.wordpress_image
  keep_locally = true

  # build {
  #   context    = "/mnt/d/Terraform/Docker/dockerfiles/wordpress/" 
  #   dockerfile = "Dockerfile"                           
  # }
}


resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = var.webserver_container
  ports {
    internal = 80
    external = 80
  }

  networks_advanced {
    name = docker_network.private_network.name
  }
}

resource "docker_container" "mariadb" {
  image = docker_image.mariadb.image_id
  name  = var.database_container

  env = [
    "MYSQL_ROOT_PASSWORD=wElcome.01K",
    "MYSQL_DATABASE=db",
    "MYSQL_USER=root",
  ]

  ports {
    internal = 3306
    external = 3306
  }

  networks_advanced {
    name = docker_network.private_network.name
  }

  volumes {
    volume_name    = docker_volume.shared_volume.name
    container_path = "/var/lib/mysql"
  }

}

resource "docker_container" "wordpress" {
  image = docker_image.wordpress.image_id
  name  = var.wordpress_container
  env = [
    "WORDPRESS_DB_HOST=mariadb",
    "WORDPRESS_DB_USER=root",
    "WORDPRESS_DB_PASSWORD=wElcome.01K",
    "WORDPRESS_DB_NAME=db"
  ]

  networks_advanced {
    name = docker_network.private_network.name
  }

  ports {
    internal = 8080
  }

  depends_on = [docker_container.mariadb]
}


resource "docker_network" "private_network" {
  name   = "test_network"
  driver = "bridge"
}

resource "docker_volume" "shared_volume" {
  name = "mariadb_volume"
}