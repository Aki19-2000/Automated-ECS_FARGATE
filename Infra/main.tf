module "vpc" {
  source = "./modules/vpc"

  vpc_cidr           = var.vpc_cidr
  vpc_name           = var.vpc_name
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  availability_zones = var.availability_zones
}

module "iam" {
  source = "./modules/iam"

  ecs_task_execution_role_name = var.ecs_task_execution_role_name
  ecs_service_role_name        = var.ecs_service_role_name
}

module "ecs" {
  source = "./modules/ecs"

  region                     = var.region
  cluster_name               = var.cluster_name
  task_family                = var.task_family
  execution_role             = module.iam.ecs_task_execution_role_arn
  task_cpu                   = var.task_cpu
  task_memory                = var.task_memory
  appointment_container_name = var.appointment_container_name
  image_url                  = var.image_url
  patient_container_name     = var.patient_container_name
  image_url_patient          = var.image_url_patient
  appointment_service_name   = var.appointment_service_name
  patient_service_name       = var.patient_service_name
  subnets                    = module.vpc.public_subnet_ids
  security_groups            = var.security_groups
  appointment_tg_arn         = var.appointment_tg_arn
  patient_tg_arn             = var.patient_tg_arn
}


module "ecs" {
  source = "./modules/ecs"

  region                     = var.region
  cluster_name               = var.cluster_name
  task_family                = var.task_family
  execution_role             = module.iam.ecs_task_execution_role_arn
  task_cpu                   = var.task_cpu
  task_memory                = var.task_memory
  appointment_container_name = var.appointment_container_name
  image_url                  = var.image_url
  patient_container_name     = var.patient_container_name
  image_url_patient          = var.image_url_patient
  appointment_service_name   = var.appointment_service_name
  patient_service_name       = var.patient_service_name
  subnets                    = module.vpc.public_subnet_ids
  security_groups            = var.security_groups
  appointment_tg_arn         = var.appointment_tg_arn
  patient_tg_arn             = var.patient_tg_arn
}
