variable "counts" {
  description = "Number of Instances to launch"
  default     = 1
}

variable "ami" {
  description = "AMI to lauch"
  default     = "ami-0ad37dbbe571ce2a1"
}

variable "instance" {
  description = "Type of Instance"
  default     = { 
	"type" = "t2.micro"
  }
}


variable "key"  {
  description = "Key pair"
  default     = {
     "name"   = "terraform"
     "pub"    = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCeGpYRbSfIiBAFE+QnCMEsm99DL5zdTB1DAYdJ5jMILNR9GoS8p/GQVCS4CNomWEtSoj89w79SASgv58cchKtNawZAWcw+ejXMSL/PlAnbIPqSOTEDZaJjDmyI+xrmjDXXGpWjZ30MyKU0VigZL3FzCMVY0SK2ml7INSMdSNwGSC1eJVPrGXeUVe60jUnLwtmEtngFI4v8J24FOXvHEz83FYVLnMaiL9itSD5XWdcCWv+I8has9MJcBzF0MJ59biOJ+SQc23M+HzXAWgXhue/LT+RcYFmPmiAzCuwNK8OkMgHqr4iUz3ZV6lfHlUcyAoQkWvbrhaV2SGd1tzG+OWil terraform@jojus-Vostro-2520"
  } 
}

variable "tags" {
  description = "Instance Tags"
  default     = {
    "name"       = "tf-frontend-01"
    "app"        = "devops-demo"
    "maintainer" = "Jijo George"
    "role"       = "frontend"
  }


  }

