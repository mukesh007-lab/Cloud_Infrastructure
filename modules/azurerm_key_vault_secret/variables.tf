variable "secrets" {
  type = map(object({
    value        = string
    content_type = optional(string)
  }))
  sensitive = true
}