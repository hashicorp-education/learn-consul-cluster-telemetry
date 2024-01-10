node_prefix "" {
  policy = "read"
}
# Set read access to all Consul servers for metrics scraping
agent "consul-server-0" {
  policy = "read"
}
agent "consul-server-1" {
  policy = "read"
}
agent "consul-server-2" {
  policy = "read"
}
# Set write access to all KV for load testing utility
key_prefix "" {
  policy = "write"
}
# Set write access to all services for load testing utility
service_prefix "" {
  policy = "write"
}
# Set write access to all ACL for load testing utility
acl = "write"