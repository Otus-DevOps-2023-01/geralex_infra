terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.87.0"
    }
  }

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "terraform-2-otus-demo-storage-bucket"
    region     = "ru-central1-a"
    key        = "terraform/state/terraform.tfstate"
    access_key = "YCAJExCfavMh7Hkrl_g2OXL34"
    secret_key = "YCPxKyLbCWMdEVekoIEo3mxaLLYFs0aS3JNFHshs"

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
  source           = "../modules/app"
  public_key_path  = var.public_key_path
  app_disk_image   = var.app_disk_image
  subnet_id        = var.subnet_id
  private_key_path = var.private_key_path
  database_url     = module.db.external_ip_address_db
  #  is_install_service = var.is_install_service

}

module "db" {
  source           = "../modules/db"
  public_key_path  = var.public_key_path
  db_disk_image    = var.db_disk_image
  subnet_id        = var.subnet_id
  private_key_path = var.private_key_path
}
