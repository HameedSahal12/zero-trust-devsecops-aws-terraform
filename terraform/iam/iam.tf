resource "aws_iam_role" "terraform_role" {
  name = "terraform-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = "*"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "terraform_policy" {
  name        = "terraform-least-privilege-policy"
  description = "Least privilege policy for Terraform execution"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
           "ec2:*",

            "iam:GetRole",
            "iam:ListRolePolicies",
            "iam:GetPolicy",
            "iam:GetPolicyVersion",
            "iam:ListAttachedRolePolicies",
            "iam:ListPolicies",

            "iam:PassRole",

            "s3:*",
            "dynamodb:*"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "terraform_attach" {
  role       = aws_iam_role.terraform_role.name
  policy_arn = aws_iam_policy.terraform_policy.arn
}
