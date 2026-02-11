################################################################################
# Read YAML Policy File
################################################################################

locals {
  # policy_file 변수가 지정되면 해당 경로 사용, 아니면 기존 방식 유지
  policy_file = var.policy_file != null ? "${path.module}/${var.policy_file}" : "${path.module}/${var.project}/${var.environment}.yaml"
  policy      = fileexists(local.policy_file) ? yamldecode(file(local.policy_file)) : {}

  # IAM 정책 파일 경로 (policy_file과 같은 레벨의 ../iam 폴더)
  # 예: ai_agent/prd/infra-policy/architecture1.yaml -> ai_agent/prd/iam/
  policy_dir = dirname(local.policy_file)
  iam_path   = "${dirname(local.policy_dir)}/iam"
}

################################################################################
# Set Default TAG
################################################################################

locals {
  service = {
    ai_agent      = "AIANT"
    data_platform = "DTPLF"
    n_tier        = "NTIER"
  }

  default_tags = {
    Owner       = "MAS"
    Environment = upper(var.environment)
    Service     = local.service[var.project]
    Creator     = "TFE"
  }
}

################################################################################
# Set Naming Rule
################################################################################

locals {
  region = {
    ap-northeast-2 = "an2"
  }

  environment = {
    prd = "p"
    stg = "s"
    dev = "d"
  }

  project = {
    ai_agent      = "aiant"
    data_platform = "dtplf"
    n_tier        = "ntier"
  }

  base_name = "aws-${local.region[var.region]}-${local.environment[var.environment]}-${local.project[var.project]}"
}