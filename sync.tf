resource "aws_iam_role" "hashicorp_vault_secrets_role" {
  count = (var.vault_secrets_sync_enabled == true ? 1 : 0)
  name  = "HCPVaultSecrets"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::879554817125:role/HCPVaultSecrets_Sync"
        }
        Condition = {
          StringEquals = {
            "sts:ExternalId" = var.vault_secrets_external_id
          }
        }
      }
    ]
  })

  inline_policy {
    name   = "HCPVaultSecrets"
    policy = data.aws_iam_policy_document.hashicorp_vault_secrets_policy.json
  }
}

data "aws_iam_policy_document" "hashicorp_vault_secrets_policy" {
  statement {
    effect = "Allow"
    actions = [
      "secretsmanager:DescribeSecret",
      "secretsmanager:GetSecretValue",
      "secretsmanager:CreateSecret",
      "secretsmanager:PutSecretValue",
      "secretsmanager:UpdateSecret",
      "secretsmanager:UpdateSecretVersionStage",
      "secretsmanager:DeleteSecret",
      "secretsmanager:RestoreSecret",
      "secretsmanager:TagResource",
      "secretsmanager:UntagResource"
    ]
    resources = ["*"]
  }
}
