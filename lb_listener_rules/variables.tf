variable "listener_arn" { //Required
  description = "(Required, Forces New Resource) The ARN of the listener to which to attach the rule."
  type        = string
}

variable "priority" { //Required
  description = "(Required, Forces New Resource) The ARN of the listener to which to attach the rule."
  type        = string
  default     = 100
}

variable "action" {
  description = ""
  type = list(object({
    type             = string //Required
    target_group_arn = string //Optional
  }))
  default = []
}

variable "path_pattern" {
  description = "(Optional) Contains a single values item which is a list of path patterns to match against the request URL."
  type = list(object({
    values = list(string)
  }))
  default = []
}

variable "host_header" {
  description = "(Optional) Contains a single values item which is a list of host header patterns to match."
  type = list(object({
    values = list(string)
  }))
  default = []
}