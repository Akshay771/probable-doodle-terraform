# # resource "google_compute_firewall" "rules" {
# #   project     = "fifth-incentive-409919"
# #   name        = "my-firewall-rule"
# #   network     = "default"
# #   description = "Creates firewall rule targeting tagged instances"

# #   allow {
# #     protocol  = "tcp"
# #     ports     = ["80", "8080", "1000-2000"]
# #   }

# #   source_tags = ["foo"]
# #   target_tags = ["web"]
# # }

# resource "google_compute_firewall" "rules" {
#   # configuration parameters go here
#   name    = "my-firewall-rule"
#   network = "default"
#   allow {
#     protocol = "tcp"
#     ports    = ["80", "443"]
#   }

#   source_tags = ["foo"]
#   target_tags = ["web"]
# }
