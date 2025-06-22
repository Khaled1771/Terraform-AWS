variable "filename" {
  type = list(string)
  default = [
    "Khaled.txt",
    "Nda.txt",
    "Assaf.txt"
  ]
}
variable "content" {
  default = "My favourite pet is Mr.werewolf"
}