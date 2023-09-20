################################## Elastic IP ###################################
resource "aws_eip" "bastion_eip" {
  depends_on = [aws_instance.test]
  instance = aws_instance.test.id
  vpc = true
  tags = local.common_tags
}
