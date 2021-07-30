variable "prefix" {
    description = "prefix for the environment"
    type        = string
}

variable "name" {
    description = "name to be appended to the prefix"
    type        = string 
}

variable "vpc_id" {
    description = "vpc id"
    type        = string 
}

variable "fsx_client_sgids" {
    description = "list of security groups for the fsx client machines"
    type        = list(string)
}

variable "tags" {
    description = "tags for the fsx and security group"
    type = map(string)
    default = {}
}

variable "managed_ad_id" {
    description = "directory id of managed ad"
    type = string
}

variable "fsx_kms_key" {
    description = "kms key for encryption"
    type = string
}

variable "storage_capacity" {
    description = "storage capacity in GB"
    type = number
}

variable "storage_type" {
    description = "storage type. SSD or HDD"
    type = string
    default = "SSD"
}

variable "subnet_ids" {
    description = "two subnet ids in different availability zones"
    type = list(string)
}

variable "throughput_capacity" {
    description = "throughput capacity for fsx"
    type = number
    default = 8
}

variable "automatic_backup_retention_days" {
    description = "automatic_backup_retention_days"
    type = number
    default = 10
}

variable "daily_automatic_backup_start_time" {
    description = "daily_automatic_backup_start_time"
    type = string
    default = "01:00"
}

variable "weekly_maintenance_start_time" {
    description = "weekly_maintenance_start_time"
    type = string
    default = "4:16:30"
}

variable "copy_tags_to_backups" {
    description = "copy_tags_to_backups"
    type = bool
    default = false
}

variable "deployment_type" {
    description = "MULTI_AZ_1, SINGLE_AZ_1"
    type = string
    default = "MULTI_AZ_1"
}

variable "preferred_subnet_id" {
    description = "which subnet has preffered file server"
    type = string
}




