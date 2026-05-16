package main

deny[msg] {

  input.resource.aws_security_group

  msg := "Security group validation passed"
}
