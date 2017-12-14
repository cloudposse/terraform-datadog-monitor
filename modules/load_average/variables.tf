variable "namespace" {
  description = "Namespace (e.g. cp or cloudposse)."
}

variable "stage" {
  description = "Stage (e.g. prod, dev, staging)."
}

variable "name" {
  description = "Name (e.g. bastion or db)."
}

variable "delimiter" {
  default = "-"
}

variable "attributes" {
  description = "Additional attributes (e.g. policy or role)."
  type        = "list"
  default     = []
}

variable "tags" {
  description = "Additional tags (e.g. map('BusinessUnit','XYZ')."
  type        = "map"
  default     = {}
}

variable "datadog_api_key" {
  description = "Datadog API key. This can also be set via the DATADOG_API_KEY environment variable."
}

variable "datadog_app_key" {
  description = "Datadog APP key. This can also be set via the DATADOG_APP_KEY environment variable."
}

variable "monitor_enabled" {
  description = "State of monitor."
  default     = "true"
}

variable "monitor_silenced" {
  description = "Each scope will be muted until the given POSIX timestamp or forever if the value is 0."
  default     = "1"
}

variable "alert_type" {
  description = "The type of the monitor (e.g. metric alert, service check, event alert, query alert)."
  default     = "metric alert"
}

variable "notify_no_data" {
  description = "A boolean indicating whether this monitor will notify when data stops reporting."
  default     = "false"
}

variable "new_host_delay" {
  description = "Time (in seconds) to allow a host to boot and applications to fully start before starting the evaluation of monitor results."
  default     = "300"
}

variable "renotify_interval" {
  description = "The number of minutes after the last notification before a monitor will re-notify on the current status. It will only re-notify if it's not resolved."
  default     = "60"
}

variable "period" {
  default = "10m"
}

variable "ok_threshold" {
  default = "1"
}

variable "warning_threshold" {
  default = "5"
}

variable "critical_threshold" {
  default = "10"
}

variable "datadog_monitor_tags" {
  description = "Configurable labels that can be applied to monitor"
  type        = "list"
  default     = ["system", "load_average"]
}

variable "selector" {
  description = "Selector for enabling monitor for specific hosts, host tags"
  type        = "list"
  default     = ["*"]
}

variable "notify" {
  description = "Notification email, hipchat or slack user/channel"
  default     = ""
}

variable "escalation_notify" {
  description = "Escalation notification email, hipchat or slack user/channel"
  default     = ""
}

variable "group_by" {
  default = "{host}"
}

variable "remediation" {
  description = "Could be added a URL to internal documentation for instructions as to how to remediate"
  default     = ""
}
