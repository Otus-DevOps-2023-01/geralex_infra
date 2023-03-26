terraform {
#  required_providers {
#    yandex = {
#      source = "yandex-cloud/yandex"
#    }
#    required_version = ">= 0.13"
#  }

    backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "terraform-2-otus-demo-storage-bucket"
    region     = "ru-central1-a"
    key        = "terraform/prod/terraform.tfstate"
    access_key = ""
    secret_key = ""

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

// Configure the Yandex.Cloud provider
provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

module "app" {
  source          = "../modules/app"
  public_key_path = var.public_key_path
  app_disk_image  = var.app_disk_image
  subnet_id       = var.subnet_id
}

module "db" {
  source          = "../modules/db"
  public_key_path = var.public_key_path
  db_disk_image   = var.db_disk_image
  subnet_id       = var.subnet_id
}
