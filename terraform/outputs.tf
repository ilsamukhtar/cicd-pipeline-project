output "ec2_public_ip" {
  description = "EC2 instance public IP"
  value       = aws_instance.flask_server.public_ip
}

output "flask_app_url" {
  description = "Flask app URL"
  value       = "http://${aws_instance.flask_server.public_ip}:5000"
}

output "health_check_url" {
  description = "Health endpoint URL"
  value       = "http://${aws_instance.flask_server.public_ip}:5000/health"
}

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}
