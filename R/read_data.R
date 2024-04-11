



#' Get fist ten rows of data
#'
#' @param data_id
#'
#' @return
#' @export
#'
#' @import DBI
#' @import duckdb
#' @import dplyr
#'
#' @examples
get_head <- function(data_id){

  library(DBI)
  library(duckdb)
  library(dplyr)


  con <- dbConnect(duckdb())
  dbExecute(con, "FORCE INSTALL httpfs")
  dbExecute(con, "LOAD httpfs")

  dbGetQuery(con,
             glue::glue("SELECT *
   FROM PARQUET_SCAN('https://data.markuskainu.fi/kelaopendata/{data_id}.parquet')
   LIMIT 10;")) -> results
  res <- as_tibble(results)
  return(res)
}



#' Get fist ten rows of data
#'
#' @param data_id
#' @param sql for filtering data
#'
#' @return
#' @export
#'
#' @import DBI
#' @import duckdb
#' @import dplyr
#'
#' @examples
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

