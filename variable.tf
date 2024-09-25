variable "rgname" {
  description = "Nombre del RG en donde se va a desplegar el recurso"
  type = string
}

variable "location" {
  description = "Region en donde se va a desplegar el recurso"
  type = string
}

variable "vnetname" {
  description = "Nombre de la Vnet en donde se va a desplegar la VM"
  type = string  
}

variable "cidrvnet" {
  description = "Espacio de red de la Vnet en donde se va a desplegar la VM"
  type = string
}

variable "subnetname" {
  description = "Nombre de la Vnet en donde se va a desplegar la VM"
  type = string  
}

variable "cidrsubnet" {
  description = "Espacio de subred de la Vnet en donde se va a desplegar la VM"
  type = string
}