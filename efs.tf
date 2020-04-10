resource "aws_efs_file_system" "propitix-efs" {
   creation_token = "propitix-efs"
   performance_mode = "generalPurpose"
   throughput_mode = "bursting"
   encrypted = "true"
  tags = {
        "Name"           = "propitix-efs",
        "Managed By"     = "Terraform",
        "Resource"       = "EFS",
        "Project"        = "Propitix"
    }
 }

# Refactor below code and avoid repeating the code
 # Create mount target 1
 resource "aws_efs_mount_target" "propitix-efs-mount-target-1" {
   count            = 1
   file_system_id   = aws_efs_file_system.propitix-efs.id
   subnet_id        = aws_subnet.private-1.id
   security_groups  = [aws_security_group.private-efs.id]
 }

 # Create mount target 2
 resource "aws_efs_mount_target" "propitix-efs-mount-target-2" {
   count            = 1
   file_system_id   = aws_efs_file_system.propitix-efs.id
   subnet_id        = aws_subnet.private-2.id
   security_groups  = [aws_security_group.private-efs.id]
 }

output "efs_dns_name" {
  value = aws_efs_file_system.propitix-efs.dns_name
}