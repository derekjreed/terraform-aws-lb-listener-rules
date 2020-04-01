# Configure the AWS Provider
provider "aws" {
  version    = "~> 2.0"
  region     = "eu-west-1"
  access_key = "<>"
  secret_key = "<>"
}


module lb_listener_test {
  source = "./lb_listener_rules/"

  listener_arn = "arn:aws:elasticloadbalancing:eu-west-1:123456789012:listener/app/my-load-balancer/50dc6c495c0c9188/f2f7dc8efc522ab2"
  priority     = 110

  action = [
    {
      type             = "forward"
      target_group_arn = "arn:aws:elasticloadbalancing:eu-west-1:123456789012:targetgroup/my-targets/73e2d6bc24d8a067"
    }
  ]

  path_pattern = [
    {
      values = ["/test/*", "/test1/*"]
    }
  ]
}