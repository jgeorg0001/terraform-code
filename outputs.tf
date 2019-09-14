output "ip" {
	value = "${aws_instance.frontend.*.public_ip}"
}
