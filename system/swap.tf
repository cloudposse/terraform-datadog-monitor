resource "datadog_monitor" "swap_free" {
  name    = "Insufficient of free swap space ${module.label.id}"
  type    = "${var.alert_type}"
  message = "Insufficient of free swap space ${var.swap_time} on host: ${data.aws_instance.monitored.instance_id} with IP: ${data.aws_instance.monitored.instance_id.public_ip}"
  query   = "avg(last_${var.swap_time}):avg:system.swap.free{host:${data.aws_instance.monitored.instance_id}} by {host} < ${var.swap_critical_state_value}"

  thresholds {
    ok       = "${var.swap_ok_state_value}"
    warning  = "${var.swap_warning_state_value}"
    critical = "${var.swap_critical_state_value}"
  }

  renotify_interval = "${var.renotify_interval_mins}"
  new_host_delay    = "${var.new_host_delay}"
  notify_no_data    = "${var.notify_no_data}"

  silenced {
    "*" = "${var.active}"
  }

  tags = ["${module.label.tags}"]
}
