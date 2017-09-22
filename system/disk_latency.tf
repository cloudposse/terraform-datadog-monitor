resource "datadog_monitor" "disk_read" {
  count   = "${var.monitor_enabled}"
  name    = "Disk read time overloaded ${module.label.id}"
  type    = "${var.alert_type}"
  message = "Disk read time overloaded last ${var.read_percent_time} on host: ${data.aws_instance.monitored.instance_id} with IP: ${data.aws_instance.monitored.public_ip}"
  query   = "avg(last_${var.read_percent_time}):avg:system.disk.read_time_pct{host:${data.aws_instance.monitored.instance_id}} by {device,host} > ${var.read_percent_critical_threshold_value}"

  thresholds {
    ok       = "${var.read_percent_ok_threshold_value}"
    warning  = "${var.read_percent_warning_threshold_value}"
    critical = "${var.read_percent_critical_threshold_value}"
  }

  renotify_interval = "${var.renotify_interval_mins}"
  new_host_delay    = "${var.new_host_delay}"
  notify_no_data    = "${var.notify_no_data}"

  silenced {
    "*" = "${var.monitor_silenced}"
  }

  tags = ["${module.label.id}"]
}

resource "datadog_monitor" "disk_write" {
  count   = "${var.monitor_enabled}"
  name    = "Disk write time overloaded ${module.label.id}"
  type    = "${var.alert_type}"
  message = "Disk write time overloaded last ${var.write_percent_time} on host: ${data.aws_instance.monitored.instance_id} with IP: ${data.aws_instance.monitored.public_ip}"
  query   = "avg(last_${var.write_percent_time}):avg:system.disk.write_time_pct{host:${data.aws_instance.monitored.instance_id}} by {device,host} > ${var.write_percent_critical_threshold_value}"

  thresholds {
    ok       = "${var.write_percent_ok_threshold_value}"
    warning  = "${var.write_percent_warning_threshold_value}"
    critical = "${var.write_percent_critical_threshold_value}"
  }

  renotify_interval = "${var.renotify_interval_mins}"
  new_host_delay    = "${var.new_host_delay}"
  notify_no_data    = "${var.notify_no_data}"

  silenced {
    "*" = "${var.monitor_silenced}"
  }

  tags = ["${module.label.id}"]
}
