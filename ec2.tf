####################### EC2 instance #################################
resource "aws_instance" "test" {
  ami = data.aws_ami_ids.ubuntu.ids[0]
  instance_type = var.instance_type_map["prod"]
  user_data              = file("${path.module}/scripts.sh")
  key_name               = "testing"
  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = 20
  }
  security_groups = ["terraform-test-SG"]
  #tags = local.common_tags

  tags = merge(
    local.common_tags,
    {
      "Name" = "terraform-instance"  # Replace with your desired instance name
    }
  )
}