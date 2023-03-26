//Create storage backend

resource "yandex_storage_bucket" "state" {
  bucket     = "terraform-2-otus-demo-storage-bucket"
  access_key = var.access_key
  secret_key = var.secret_key
}

#data "terraform_remote_state" "vpc" {
#  backend = "s3"
#  config = {
#    endpoint   = "storage.yandexcloud.net"
#    bucket     = "terraform-2-otus-demo-storage-bucket-stage"
#    region     = "ru-central1"
#    key        = "terraform/state/terraform.tfstate"
#    access_key = ""
#    secret_key = ""

#    skip_region_validation      = true
#    skip_credentials_validation = true
#  }
#}
