resource "aws_instance" "web" {

  connection {
    user = "ubuntu"
  }

  instance_type = "t2.micro"
  count = "${var.web-instances.count}"
  ami = "${lookup(var.aws_amis, var.aws_region)}"
  key_name = "${aws_key_pair.auth.id}"
  vpc_security_group_ids = ["${aws_security_group.default.id}"]
  subnet_id = "${aws_subnet.default.id}"

  tags {
    Name = "${format("web-%d", count.index + 1)}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get -y update",
      "sudo apt-get -y install nginx",
      "sudo service nginx start"
    ]
  }
}
