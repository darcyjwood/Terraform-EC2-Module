# compute outputs.tf

output "public_ip" {
  value = aws_instance.app_server.public_ip
}

# output "fingerprint" {
#   value = data.aws_key_pair.tfec2mod.fingerprint
# }

# output "name" {
#   value = data.aws_key_pair.tfec2mod.key_name
# }

# output "id" {
#   value = data.aws_key_pair.tfec2mod.id
# }