locals {
  complete_tags = {
    Creator       = "terraform"
    projectNumber = "fs00023"
    environment   = "prod"
  }

  incomplete_tags = {
    Creator = "terraform"
    #projectNumber = "fs00023"
    environment = "prod"
  }
}
