resource "aws_cloudformation_stack" "network" {
  name = "networking-stack"

  parameters = {
    VPCCidr = "100.0.0.0/24"
  }

  template_body = <<STACK
{
  "Parameters" : {
    "VPCCidr" : {
      "Type" : "String",
      "Default" : "100.0.0.0/24",
      "Description" : "Enter the CIDR block for the VPC. Default is 100.0.0.0/24."
    }
  },
  "Resources" : {
    "myVpc": {
      "Type" : "AWS::EC2::VPC",
      "Properties" : {
        "CidrBlock" : { "Ref" : "VPCCidr" },
        "Tags" : [
          {"Key": "Name", "Value": "Primary_CF_VPC"}
        ]
      }
    }
  }
}
STACK
}
