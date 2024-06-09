resource "aws_iam_instance_profile" "profile" {
  name               = "${var.project}-profile"
  role               = aws_iam_role.role.name
}

resource "aws_iam_role" "role" {
  name               = "${var.project}-role"
  path               = var.role_path
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}