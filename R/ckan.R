
#' List published data in avoindata.fi CKAN
#'
#' @param org organisation to get listning from
#' @param n number of hits
#'
#' @importFrom ckanr ckanr_setup
#' @importFrom ckanr package_search
#' @importFrom glue glue
#' @importFrom dplyr as_tibble
#' @importFrom dplyr bind_rows
#' @importFrom dplyr filter
#' @importFrom dplyr %>%

#'
#' @return data.frame
#' @export
#'
list_ckan <- function(org = "Kansaneläkelaitos", n = 100){

  ckanr::ckanr_setup(url = "https://www.avoindata.fi/data/fi/")
  x <- ckanr::package_search(q = org, rows = n)

  count <- x$count

  dat_lst <- list()
  for (i in 1:count){
    dat_lst[[i]]  <- dplyr::tibble(
      id = x$results[[i]]$id,
      title = x$results[[i]]$title,
      modified = x$results[[i]]$metadata_modified,
      owner = x$results[[i]]$owner
    )
  }
  dat <- do.call(bind_rows, dat_lst) %>%
    dplyr::filter(owner == "6c2af1b3-2309-4fc6-9b47-59b14fe10a9c")

  datasets <- dat$id
  names(datasets) <- dat$title
  datasets <- sort(datasets)
  res <- list(datasets = datasets,
              results = x$results)
  return(res)
}

#' List datasets
#'
#' @return data.frame
#'
#' @importFrom dplyr bind_rows arrange mutate
#'
#' @export
#'
list_datasets <- function(){
  dsets <- list_ckan()
  dlist <- list()
  for (i in seq(dsets$results)){
    tmp <- dsets$results[i]
    dlist[[i]] <- data.frame(
      modified = tmp[[1]]$metadata_modified,
      name = tmp[[1]]$name,
      id = tmp[[1]]$id
    )
  }
  res <- do.call("bind_rows", dlist) %>%
    as_tibble() %>%
    mutate(modified = as.Date(modified)) %>%
    arrange(desc(modified))
  return(res)
}




#' Get details from a package
#'
#' @param input_dataset
#'
#' @return list
#' @export
#'
pick_a_pkg <- function(input_dataset = "8df7939b-6c0e-4587-9aa1-95c076e7b0a3"){

  res <- list_ckan()
  # input_dataset <- "8df7939b-6c0e-4587-9aa1-95c076e7b0a3"
  nro <- lapply(res$results, function(x)x$id %in% input_dataset) |> unlist() |> which()
  pkg <- res$results[[nro]]
  # mikä on json-resurssi
  json_nr <- grep("JSON",
                  do.call(c,
                          lapply(
                            pkg$resources, function(x) x$format
                          )))
  pkg_lst <- list("pkg" = pkg,
                  "json_nr" = json_nr)

  return(pkg_lst)
}

#' Get links to csv files
#'
#' @param pkg_lst
#'
#' @return string
#' @export
#'
get_csv_links <- function(pkg_lst){
  pkg <- pkg_lst$pkg
  json_nr <- pkg_lst$json_nr

  # csv linkit
  if (json_nr > 2){
    lnk_lst <- list()
    for (i in 1:(json_nr-1)){
      lnk_lst[[i]]  <- pkg$resources[[i]]$url
    }
    csv_links <- lnk_lst

  } else {
    csv_links <- pkg$resources[[1]]$url
  }
  return(csv_links)
}
