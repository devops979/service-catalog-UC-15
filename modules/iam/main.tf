
resource "aws_iam_role" "launch_role" {
  name = var.launch_role_name
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "servicecatalog.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_policy" "ec2_only_policy" {
  name = "${var.launch_role_name}-ec2-policy"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "cloudformation:CreateStack",
          "cloudformation:DeleteStack",
          "cloudformation:DescribeStackEvents",
          "cloudformation:DescribeStacks",
          "cloudformation:GetTemplateSummary",
          "cloudformation:SetStackPolicy",
          "cloudformation:ValidateTemplate",
          "cloudformation:UpdateStack",
          "ec2:*",
          "s3:GetObject",
          "servicecatalog:*"
        ],
        "Resource" : "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.launch_role.name
  policy_arn = aws_iam_policy.ec2_only_policy.arn
}



resource "aws_servicecatalog_principal_portfolio_association" "access" {
  principal_type = "IAM"
  portfolio_id   = var.portfolio_id
  principal_arn  = "arn:aws:iam::211125325699:user/iam-lumenore"
}
