server {
  enabled          = "{{ nomad_server }}"
  bootstrap_expect = "{{ nomad_bootstrap_expect }}"
}

tls {
  http = true
  rpc  = true

  ca_file = "nomad-ca.pem"
  cert_file = "server.pem"
  key_file  = "server-key.pem"

  verify_server_hostname = true
  verify_https_client    = true
}
