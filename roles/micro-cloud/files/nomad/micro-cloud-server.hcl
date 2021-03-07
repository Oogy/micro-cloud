server {
  enabled          = "{{ nomad_server }}"
  bootstrap_expect = "{{ nomad_bootstrap_expect }}"
}
