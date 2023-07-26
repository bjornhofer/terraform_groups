provider "azuread" {}

resource "azuread_group" "owners" {
  display_name     = "${var.group_base_name}-owners"
  description      = "Owners"
  security_enabled = true
  mail_enabled     = false
}

data "azuread_user" "owners" {
  for_each            = toset(var.owners)
  user_principal_name = each.value
}

resource "azuread_group_member" "owners" {
  for_each         = toset(var.owners)
  group_object_id  = azuread_group.owners.id
  member_object_id = data.azuread_user.owners[each.value].id
}

resource "azuread_group" "contributers" {
  display_name     = "${var.group_base_name}-contributers"
  description      = "Contributors"
  security_enabled = true
  mail_enabled     = false
}

data "azuread_user" "contributers" {
  for_each            = toset(var.contributers)
  user_principal_name = each.value
}

resource "azuread_group_member" "contributers" {
  for_each         = toset(var.contributers)
  group_object_id  = azuread_group.contributers.id
  member_object_id = data.azuread_user.contributers[each.value].id
}

resource "azuread_group" "readers" {
  display_name     = "${var.group_base_name}-readers"
  description      = "Readers"
  security_enabled = true
  mail_enabled     = false
}

data "azuread_user" "readers" {
  for_each            = toset(var.readers)
  user_principal_name = each.value
}

resource "azuread_group_member" "readers" {
  for_each         = toset(var.readers)
  group_object_id  = azuread_group.readers.id
  member_object_id = data.azuread_user.readers[each.value].id
}
