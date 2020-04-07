resource "aws_key_pair" "deployer-darey" {
  key_name   = "deployer-darey.io"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCz1DVRC5SptBvmBSbfvtEv9euIEyDXFSiLeAWZjJ5tp3sQRc+a/XOk98dstR8bayW+ZzuvTdfSACMkqN+jrsAHcwdmkbtoSP2w40CKaXcp6AxdsZfs11kcL+s1+fa1RXEV/XrTIOt1vQkAZ42fg6sI11uLa36H5XsQro1hqjGcKXmYC+p7h0pAxdOOtXyrxwpI6c6UMGOGxyZ6azFRbl12V7D+8hIKpoCzhvjRyK8fYTmZM9LC610CJ50kCyinFfjKUOuthplQEY2T+qxeXs0hhwbGtvUD4GD+NgG+abF1Orfq/8c91hVcSyI/5gnOHIwHA8MnRgRi/Z3tiZWk3STp"

  tags = {
        "Name"           = "deployer-darey",
        "Managed By"     = "Terraform",
        "Resource"       = "Key-Pair",
        "Project"        = "Propitix"
    }

}

