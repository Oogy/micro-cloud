client {
  enabled = "{{ nomad_client }}"
  servers = ["127.0.0.1:4647"]
}

ports {
  http = 5656
}

tls {
  http = true
  rpc  = true

  ca_file = "{{ nomad_ssl_dir }}/nomad-ca.pem"
  cert_file = "{{ nomad_ssl_dir }}/client.pem"
  key_file  = "{{ nomad_ssl_dir }}/client-key.pem"

  verify_server_hostname = true
  verify_https_client    = true
}
