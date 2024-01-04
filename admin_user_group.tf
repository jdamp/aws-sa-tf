// Create group called admin and attach the AdministratorAccess policy to it
resource "aws_iam_group" "administrators" {
  name = "Administrators"
  path = "/"
}

data "aws_iam_policy" "administrator_access" {
  name = "AdministratorAccess"
}

resource "aws_iam_group_policy_attachment" "administrators" {
  group      = aws_iam_group.administrators.name
  policy_arn = data.aws_iam_policy.administrator_access.arn
}

resource "aws_iam_user" "iamadmin" {
  name = "iamadmin"
}

resource "aws_iam_user_group_membership" "administrators-users" {
  user   = aws_iam_user.iamadmin.name
  groups = [aws_iam_group.administrators.name]
}

resource "aws_iam_user_login_profile" "administrator" {
  user                    = aws_iam_user.iamadmin.name
  password_reset_required = true
}

output "password" {
  value     = aws_iam_user_login_profile.administrator.password
  sensitive = true
}