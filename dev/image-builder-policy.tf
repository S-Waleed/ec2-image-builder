data "aws_iam_policy_document" "image_builder" {
  statement {
    sid    = "FullControl"
    effect = "Allow"
    actions = [
      "ssm:*",
      "ec2:*",
      "ssmmessages:*"
    ]
    resources = ["*"]
  }

  statement {
    sid    = "DownloadFromS3"
    effect = "Allow"
    actions = [
      "s3:List*",
      "s3:Get*",
    ]
    resources = ["*"]
  }
}
