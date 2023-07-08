list_conditions <- function(wb_servers, connect_servers, pm_servers, os, auth) {
  cust_conditions <- c("all", os, auth)
  cust_conditions <- if (wb_servers > 0) {
    append(cust_conditions, "workbench")
  } else {
    (cust_conditions)
  }
  cust_conditions <- if (wb_servers > 1) {
    append(cust_conditions, "workbench_ha")
  } else {
    (cust_conditions)
  }
  cust_conditions <- if (connect_servers > 0) {
    append(cust_conditions, "connect")
  } else {
    (cust_conditions)
  }
  cust_conditions <- if (connect_servers > 1) {
    append(cust_conditions, "connect_ha")
  } else {
    (cust_conditions)
  }
  cust_conditions <- if (pm_servers > 0) {
    append(cust_conditions, "packagemanager")
  } else {
    (cust_conditions)
  }
  cust_conditions <- if (pm_servers > 1) {
    append(cust_conditions, "pm_ha")
  } else {
    (cust_conditions)
  }
  return(cust_conditions)
}

build_checklist <- function(data, cust_conditions) {
  dplyr::filter(data, Conditions %in% cust_conditions)
}

filter_table <- function(data) {
  data |> 
    select(Category, Step, Info) |> 
    group_by(Category)
}
