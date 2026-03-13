variable "vpc_id" {
  description = "enter vpc id"
}

variable "image" {
  default = "ami-02dfbd4ff395f2a1b"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "subnet_id" {
  description = "Enter subnet id"
}