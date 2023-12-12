data "aws_iam_role" "lab_role" {
  name = "LabRole"
}

data "aws_iam_users" "lab_role2" {
  name_regex = ".*LabRole.*"
}

output "lab_role2" {
  value = data.aws_iam_users.lab_role2
}
