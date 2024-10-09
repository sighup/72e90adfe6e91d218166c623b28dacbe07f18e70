# Define the required provider
terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

# Input variable to define the number of random strings
variable "number_of_strings" {
  description = "Number of random strings to generate"
  type        = number
  default     = 5
}

# Generate random strings using a for_each loop
resource "random_string" "strings" {
  count = var.number_of_strings

  length  = 24
  special = false
  upper   = true
  lower   = true
  number  = true
}

# Output the generated random strings
output "random_strings" {
  value = random_string.strings[*].result
}

