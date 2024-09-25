variable "rgname" {
  description = "Nombre del RG en donde se va a desplegar el recurso"
  type        = string
}

variable "location" {
  description = "Region en donde se va a desplegar el recurso"
  type        = string
}

variable "vnetname" {
  description = "Nombre de la Vnet en donde se va a desplegar la VM"
  type        = string
}

variable "cidrvnet" {
  description = "Espacio de red de la Vnet en donde se va a desplegar la VM"
  type        = string
}

variable "subnetname" {
  description = "Nombre de la Vnet en donde se va a desplegar la VM"
  type        = string
}

variable "cidrsubnet" {
  description = "Espacio de subred de la Vnet en donde se va a desplegar la VM"
  type        = string
}

variable "netinterface" {
  description = "Nombre de la Network inteface que va a usar la VM"
  type        = string
}

variable "vmname" {
  description = "Nombre de la VM"
  type        = string
}

variable "sizevm" {
  description = "Tamaño de la VM"
  type        = string
}