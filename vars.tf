variable REGION {
    default = "us-east-2"
}


variable ZONE {
  default = "us-east-2a"

}

variable AMIS {
   type = map
   default = {
        us-east-2 = "ami-064ff912f78e3e561"
        us-east-1 = "ami-0c02fb55956c7d316"
   }
}


variable USER {
  default = "ec2-user"
}


variable PUB_KEY {
   default = "esiddiqi-vpc-key-terraform.pub"
}

variable PRIV_key {
   default = "esiddiqi-vpc-key-terraform"

}


variable ZONE1 {
   default = "us-east-2a"

}


variable ZONE2 {
  default = "us-east-2b"
}


variable ZONE3 {
  default = "us-east-2c"
}




