output "public_dns_Rancher" {
  value = aws_instance.publicInstanceRancher.public_dns
}

output "public_ip_Rancher" {
  value = aws_instance.publicInstanceRancher.public_ip
}

output "public_dns_k8s" {
  value = aws_instance.publicInstanceK8s.*.public_dns
}

output "public_ip_k8s" {
  value = aws_instance.publicInstanceK8s.*.public_ip
}