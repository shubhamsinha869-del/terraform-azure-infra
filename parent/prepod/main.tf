module "resource_group" {
  source = "../../child/resource_group"
  rgs    = var.rgs
}
module "azurerm_virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../child/azurerm_virtual_network"
  vnets      = var.vnets

}
module "subnets" {
  depends_on = [module.azurerm_virtual_network]
  source     = "../../child/azurerm_subnet"
  subnets    = var.subnets
}
module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../child/azurerm_public_ip"
  public_ip  = var.public_ip

}