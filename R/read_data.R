




#' Download a table and use optional sql filters
#'
#' @param data_id data id
#' @param sql for filtering data NA if you want the whole data
#'
#' @return tibble
#' @export
#'
#' @importFrom DBI dbConnect
#' @importFrom DBI dbExecute
#' @importFrom DBI dbGetQuery
#' @import duckdb
#' @importFrom glue glue
#' @importFrom dplyr as_tibble
#' @importFrom dplyr %>%
#'
get_data <- function(data_id, sql = NA){

  con <- dbConnect(duckdb())
  dbExecute(con, "FORCE INSTALL httpfs")
  dbExecute(con, "LOAD httpfs")
  dbGetQuery(con,
             glue::glue("SELECT *
   FROM PARQUET_SCAN('https://data.markuskainu.fi/kelaopendata/{data_id}.parquet')
   {sql}")) -> results
  dbDisconnect(con)
  res <- as_tibble(results)
  return(res)
}






#' Download metadata
#'
#' @param data_id data id
#'
#' @return list
#' @export
#'
#' @importFrom jsonlite fromJSON
#'
get_metadata <- function(data_id){
  res <- jsonlite::fromJSON(glue::glue('https://data.markuskainu.fi/kelaopendata/{data_id}.json'))
  return(res)
}

