variable "pets" {
  type = number
}

resource "random_pet" "example" {
  count  = var.pets
  length = 3
}

output "timestamp" {
  value = timestamp()
}

output "pets" {
  value = length(random_pet.example)
}

output "ids" {
  value = [for pet in random_pet.example: pet.id]
}

output "password" {
  value     = join("-", [for pet in random_pet.example: pet.id])
  sensitive = true
}
