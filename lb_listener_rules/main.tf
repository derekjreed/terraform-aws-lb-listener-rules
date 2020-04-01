/*
variable "listener_arn" {//Required
  description = "(Required, Forces New Resource) The ARN of the listener to which to attach the rule."
  type = string
}

variable "priority" {//Required
  description = "(Required, Forces New Resource) The ARN of the listener to which to attach the rule."
  type = string
  default = 100
}

variable "action" {
  description = ""
  type = list(object({
    type = string  //Required
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
*/

resource "aws_lb_listener_rule" "this" {

  listener_arn = var.listener_arn
  priority     = var.priority

  dynamic "action" {
    for_each = var.action
    content {
      type             = action.value.type
      target_group_arn = action.value.target_group_arn
    }
  }

  condition {
    dynamic "path_pattern" {
      for_each = var.path_pattern
      content {
        values = path_pattern.value.values
      }
    }
  }

  condition {
    dynamic "host_header" {
      for_each = var.host_header
      content {
        values = host_header.value.values
      }
    }
  }
}