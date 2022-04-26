# ## Copyright (c) 2022, Oracle and/or its affiliates.
# ## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

variable "tenancy_ocid" {}
variable "compartment_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "ssh_public_key" {
  default = ""
}

variable oci_username {
  default = ""
}

variable oci_user_authtoken {
  default = ""
}

variable "app_name" {
  default     = "DevOps"
  description = "Application name. Will be used as prefix to identify resources, such as OKE, VCN, DevOps, and others"
}


variable "release" {
  description = "Reference Architecture Release (OCI Architecture Center)"
  default     = "1.0.5"
}

variable "project_logging_config_retention_period_in_days" {
  default = 30
}

variable "project_description" {
  default = "DevOps CI/CD Sample Project"
}


variable "compute_instance_blue_name" {
  default = "devops-instance-blue"
}

variable "compute_instance_green_name" {
  default = "devops-instance-green"
}

variable "instance_shape" {
  description = "Instance Shape"
  default     = "VM.Standard.E3.Flex"
}

variable "instance_ocpus" {
  default = 1
}

variable "instance_shape_config_memory_in_gbs" {
  default = 1
}

variable "instance_os" {
  description = "Operating system for compute instances"
  default     = "Oracle Linux"
}

variable "linux_os_version" {
  description = "Operating system version for all Linux instances"
  default     = "7.9"
}

variable "availablity_domain_name" {
  default = ""
}

variable "VCN-CIDR" {
  default = "10.0.0.0/16"
}

variable "Subnet-CIDR" {
  default = "10.0.1.0/24"
}

variable "repository_name" {
  default = "oci-devops-instances-with-blue-green-model"
}

variable "repository_default_branch" {
  default = "main"
}

variable "repository_description" {
  default = "OCI Devops blue greeninstance sample application"
}

variable "repository_repository_type" {
  default = "HOSTED"
}

variable "git_repo" {
  default = "https://github.com/RahulMR42/oci-devops-deploy-instances-with-blue-green-model.git"
}

variable "git_repo_name" {
  default = "oci-devops-deploy-instances-with-blue-green-model"
}


locals {
  ocir_namespace = lookup(data.oci_objectstorage_namespace.ns, "namespace")
}


variable "build_pipeline_description" {
  default = "build pipeline for python application with blue-green deployment strategies"
}

variable "build_pipeline_display_name" {
  default = "oci_devops_bluegreen_build_pipeline_with_instances"
}

variable "devops_artifact_name"{
  default = "mr_test_bg_artifact_instances"
}

variable "deploy_artifact_version"{
  default = "0.0"
}

variable "build_pipeline_stage_build_pipeline_stage_predecessor_collection_items_id" {
  default = "id"
}

variable "build_pipeline_stage_build_pipeline_stage_type" {
  default = "BUILD"
}

variable "build_pipeline_stage_build_source_collection_items_connection_type" {
  default = "DEVOPS_CODE_REPOSITORY"
}


variable "build_pipeline_stage_build_source_collection_items_branch" {
  default = "main"
}

variable "build_pipeline_stage_build_source_collection_items_name" {
  default = "deploy_bluegreen_instances"
}

variable "build_pipeline_stage_build_spec_file" {
  default = ""
}

variable "build_pipeline_stage_display_name" {
  default = "python_app_build_stage"
}

variable "build_pipeline_stage_image" {
  default = "OL7_X86_64_STANDARD_10"
}

variable "build_pipeline_stage_wait_criteria_wait_duration" {
  default = "waitDuration"
}

variable "build_pipeline_stage_wait_criteria_wait_type" {
  default = "ABSOLUTE_WAIT"
}

variable "build_pipeline_stage_stage_execution_timeout_in_seconds" {
  default = 36000
}

variable "build_pipeline_stage_deliver_artifact_stage_type" {
  default = "DELIVER_ARTIFACT"
}

variable "build_pipeline_stage_deliver_artifact_collection_items_artifact_name" {
  default = "instace_deploy_manifest"
}


variable "deliver_artifact_stage_display_name" {
  default = "deliver_artifact"
}

variable "loadbalancer_display_name"{
  default = "lb_devops_instance_bluegreen"
}

variable "loadbalancer_listner_name"{
  default = "devops_lb_listner"
}

variable "maximum_bandwidth_in_mbps" {
  default = 10
}

variable "minimum_bandwidth_in_mbps" {
  default = 10 
}

variable "loadbalancer_backend_set_name" {
  default = "lb_backendset_for_bluegreen"
}

variable "loadbalancer_backendset_policy" {
  default = "ROUND_ROBIN"
}

variable "loadbalancer_backendset_port" {
  default = 80
}

variable "loadbalancer_backend_port" {
  default = 80
}

variable "deploy_pipeline_description" {
  default = "Devops CI/CD Pipleline demo for Instances  with bluegreen model"
}

variable "build_pipeline_stage_deploy_stage_type" {
  default = "TRIGGER_DEPLOYMENT_PIPELINE"
}



variable "deploy_stage_display_name" {
  default = "deploy_to_instances"
}

variable "build_pipeline_stage_is_pass_all_parameters_enabled" {
  default = true
}


variable "devops_env_blue_displayname"{
  default = "env_instance_blue"
}

variable "devops_env_blue_query" {
  default =  "freeformTags.key = 'environment' && freeformTags.value = 'blue'"
}

variable "devops_env_green_displayname"{
  default = "env_instance_green"
}

variable "devops_env_green_query" {
  default =  "freeformTags.key = 'environment' && freeformTags.value = 'green'"
}


variable "bluegreen_deploy_stage_description"{
  default = "Deploy to instances "
}

variable "bluegreen_deploy_stage_name"{
  default = "deploy_to_instances"
}

variable "batch_delay_in_seconds"{
  default = 5
}

variable "approval_stage_description" {
  default = "Approval for release"
}

variable "approval_display_name" {
  default = "approval_stage"
}

variable "approval_count"{
  default = 1
}

variable "blue_green_stage_shift_description"{
  default = "switch the traffic between environment"
}

variable "blue_green_stage_shift_name"{
  default = "blue_green_traffic_shift"
}



