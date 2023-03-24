//output "external_ip_address_app" {
//  value = yandex_compute_instance.app.*.network_interface.0.nat_ip_address
//}

//output "lb_ip_address" {
//  value = yandex_lb_network_load_balancer.load-balancer.*
//}

//output "lb_ip_address" {
//  value = yandex_lb_network_load_balancer.load-balancer.listener.*.external_address_spec[0].*.address
//}

//output "external_ip_address_app" {
//  value = yandex_compute_instance.app.network_interface.0.nat_ip_address
//}
//output "external_ip_address_db" {
//  value = yandex_compute_instance.db.network_interface.0.nat_ip_address
//}

output "external_ip_address_app" {
  value = module.app.external_ip_address_app
}
output "external_ip_address_db" {
  value = module.db.external_ip_address_db
}


#output "access_key" {
#  value = yandex_iam_service_account_static_access_key.sa-static-key.access_key
#  sensitive = true
#}
#output "secret_key" {
#  value = yandex_iam_service_account_static_access_key.sa-static-key.secret_key
#  sensitive = true
#}
