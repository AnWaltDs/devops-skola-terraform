# customer.hcl — anchor at the customer level.
# Leaf configs include this to derive the customer name from the directory path.
#
# In a real setup this could also hold customer-wide defaults
# (e.g. cost center, contact, SLA tier).

locals {
  # This file is intentionally minimal for the workshop.
  # Its main purpose is to serve as an anchor for path_relative_to_include().
}
