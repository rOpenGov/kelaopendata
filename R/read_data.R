




#' Download a table and use optional sql filters
#'
#' @param data_id data id
#' @param sql for filtering data NA if you want the whole data
#'
#' @return tibble
#' @export
#'
#' @import DBI
#' @import duckdb
#' @import dplyr
#'
get_data <- function(data_id, sql = NA){

  library(DBI)
  library(duckdb)
  library(dplyr)


  con <- dbConnect(duckdb())
  dbExecute(con, "FORCE INSTALL httpfs")
  dbExecute(con, "LOAD httpfs")

  dbGetQuery(con,
             glue::glue("SELECT *
   FROM PARQUET_SCAN('https://data.markuskainu.fi/kelaopendata/{data_id}.parquet')
   {sql}")) -> results
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
#' @import jsonlite
#'
get_metadata <- function(data_id){
  res <- jsonlite::fromJSON(glue::glue('https://data.markuskainu.fi/kelaopendata/{data_id}.json'))
  return(res)
}

