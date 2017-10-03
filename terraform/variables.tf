variable project {
  default = "infra-180517"
}

variable region {
  default = "europe-west1"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}

variable db_disk_image {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}

variable public_key_path {
  default = "~/.ssh/appuser.pub"
}
