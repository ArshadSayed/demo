provider "aws" {
    region = "us-east-2"
     access_key = "AKIA463F3FYCPTYXH4OJ"
    secret_key = "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"
}
module "my_vpc" {
    source = "../module/vpc"
    vpc_cidr = "192.168.0.0/16"
    tenancy = "default"
    vpc_id = "${module.my_vpc.vpc_id}"
    subnet_cidr = "192.168.0.0/16"
}

module "my_ec2" {
    source = "../module/ec2"
    ec2_count =1
    ami_id   = "ami-02ccb28830b645a41"
    instance_type = "t2.nano"
    subnet_id = "${module.my_vpc.subnet_id}"
} 