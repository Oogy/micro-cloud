client {
  enabled = "{{ nomad_client }}"
  servers = ["127.0.0.1:4647"]
}

ports {
  http = 5656
}
