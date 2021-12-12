variable "default_tags_master" {
  type = map(string)
  default = {
    "Name" : "cev-Master"
    "Env" : "Dev"
    "Project Owner" : "Cevahir Biber"
  }
}
variable "default_tags_worker" {
  type = map(string)
  default = {
    "Name" : "cev-Worker"
    "Env" : "Dev"
    "Project Owner" : "Cevahir Biber"
  }
}
variable sg_id {}
