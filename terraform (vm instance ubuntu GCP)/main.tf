provider "google" {
credentials = file("annular-mesh-472406-t6-e94ec69a9466.json")
project = "annular-mesh-472406-t6"
region = "asia-southeast1 (Singapore)"
}
resource "google_compute_instance" "example" {
name = "server-irwan"
machine_type = "e2-small"
zone = "asia-southeast1-a"
boot_disk {
initialize_params {
image = "ubuntu-os-cloud/ubuntu-minimal-2404-noble-arm64-v20250930"
}
}
network_interface {
network = "default"
access_config {
// Ephemeral IP
}
}
}
