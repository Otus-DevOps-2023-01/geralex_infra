#locals {
#  folder_id = "b1g3l9isrnq8ofkdnu9b"
#}

#// Create SA
#resource "yandex_iam_service_account" "sa" {
#  folder_id = local.folder_id
#  name      = "tf-test-sa"
#}

#// Grant permissions
#resource "yandex_resourcemanager_folder_iam_member" "sa-editor" {
#  folder_id = local.folder_id
#  role      = "storage.editor"
#  member    = "serviceAccount:${yandex_iam_service_account.sa.id}"
#}

#// Create Static Access Keys
#resource "yandex_iam_service_account_static_access_key" "sa-static-key" {
#  service_account_id = yandex_iam_service_account.sa.id
#  description        = "static access key for object storage"
#}

#// Use keys to create bucket
#resource "yandex_storage_bucket" "state" {
#  access_key = yandex_iam_service_account_static_access_key.sa-static-key.access_key
#  secret_key = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
#  bucket = "terraform-2-otus-demo-storage-bucket"
#}

//Create storage backend
resource "yandex_storage_bucket" "state" {
  bucket     = "terraform-2-otus-demo-storage-bucket"
  access_key = ""
  secret_key = ""
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
