.onAttach <- function(lib, pkg) {
  packageStartupMessage(paste0("kelaopendata ",
                               utils::packageVersion("kelaopendata"),
                               ": Access open data from Kela.\nhttps://github.com/ropengov/kelaopendata\nData is licensed under CC-BY 4.0. Please give appropriate attribution to Kela when using data."))
}
