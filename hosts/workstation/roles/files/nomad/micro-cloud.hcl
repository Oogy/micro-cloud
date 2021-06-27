datacenter = "{{ nomad_datacenter }}"
data_dir   = "{{ nomad_data_dir }}"

server {
  enabled          = "{{ nomad_server }}"
  bootstrap_expect = "{{ nomad_bootstrap_expect }}"
}

client {
  enabled = "{{ nomad_client }}"
  servers = ["127.0.0.1:4647"]
}
