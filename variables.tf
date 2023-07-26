variable "group_base_name" {
  type        = string
  description = "base name for the group"
}

variable "owners" {
  type        = list(string)
  description = "list of owners"
  default     = []
}

variable "contributers" {
  type        = list(string)
  description = "list of contributers"
  default     = []
}

variable "readers" {
  type        = list(string)
  description = "list of readers"
  default     = []
}
