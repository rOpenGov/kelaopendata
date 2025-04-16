library(ckanr)
library(dplyr)
library(kelaopendata)
datasets <- list_ckan()
dir.create("./inst/data-parquet/")

n_datasets <- length(datasets$datasets)

for (i in seq(n_datasets)){
  print(i)
  id <- datasets$datasets[[i]]
  pkg_lst <- pick_a_pkg(input_dataset = id)

  csv_links <- get_csv_links(pkg_lst = pkg_lst)
  json_link <- pkg_lst$pkg$resources[[pkg_lst$json_nr]]$url

  flst <- lapply(csv_links, readr::read_csv)
  whole_data <- do.call('rbind', flst)
  arrow::write_parquet(x = whole_data, sink = paste0("./inst/data-parquet/",id,".parquet"))
  download.file(json_link, destfile = paste0("./inst/data-parquet/",id,".json"))
}

dlist <- list()
for (i in seq(n_datasets)){
  print(i)
  tmplist <- list()
  tmplist$id <- datasets$datasets[[i]]
  pkg_lst <- pick_a_pkg(input_dataset = id)
  tmplist$name_clean <- pkg_lst$pkg$name
  tmplist$title <- pkg_lst$pkg$title
  tmplist$url_tietotarjotin <- pkg_lst$pkg$external_urls[[1]]
  tmplist$updated <- pkg_lst$pkg$resources[[2]]$status_updated
  tmplist$csv_links <- get_csv_links(pkg_lst = pkg_lst)
  tmplist$json_link <- pkg_lst$pkg$resources[[pkg_lst$json_nr]]$url
  dlist[[i]] <- tmplist
}
jsonlite::write_json(x = dlist, path = "./inst/data-parquet/datasets.json")

system(paste0("rsync -avz ./inst/data-parquet/ ",Sys.getenv("kelaopendata_server")))



