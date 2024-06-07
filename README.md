
<!-- badges: start -->

[![rOG-badge](https://ropengov.github.io/rogtemplate/reference/figures/ropengov-badge.svg)](https://ropengov.org/)
[![R build
status](https://github.com/rOpenGov/geofi//workflows/R-CMD-check/badge.svg)](https://github.com/rOpenGov/geofi/actions/)
[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/)
[![codecov](https://codecov.io/gh/rOpenGov/geofi/branch/master/graph/badge.svg?token=yJSHHMSSKs)](https://app.codecov.io/gh/rOpenGov/kelaopendata)
[![CRAN
published](https://www.r-pkg.org/badges/version/kelatools)](https://www.r-pkg.org/pkg/kelatools)
<!-- badges: end -->

# kelaopendata - Access open data from National social insurance institution of Finland

Finnish national social insurance institution
[Kela](https://www.kela.fi/) publishes open data on recipients,
reimbursements and costs of various social security benefits in Finland
at <https://www.avoindata.fi/data/fi/organization/kela>.
`kelaopendata`-package takes advantage of modern big data technologies
such as [duckdb](https://duckdb.org/) and [Apache
Parquet](https://parquet.apache.org/) and provides fast and
straightforward access to data.

Below is a one example on how you can access data using `kelaopendata`.
Please have a closer look at the
[vignettes](https://ropengov.github.io/kelaopendata/articles/index.html)
for more comprehensive use cases.

## Installation and use

``` r
# Not yet published in CRAN

# Install development version from GitHub
remotes::install_github("rOpenGov/kelaopendata")
```

## List available datasets

``` r
library(kelaopendata)
dsets <- list_datasets()
print(dsets, n = 50)
```

    ## # A tibble: 23 × 3
    ##    modified   name                                                         id   
    ##    <date>     <chr>                                                        <chr>
    ##  1 2024-05-28 suomen-elakkeensaajat-ja-keskimaaraiset-elakkeet             e88d…
    ##  2 2024-05-15 kuntien-rahoittama-tyomarkkinatuki                           970f…
    ##  3 2024-05-15 sairauspaivarahojen-saajat-ja-maksetut-etuudet-diagnooseitt… dd43…
    ##  4 2024-05-15 sairauspaivarahojen-saajat-ja-maksetut-etuudet-sairauspaary… a2ce…
    ##  5 2024-05-15 maksetut-yleiset-asumistuet1                                 f80f…
    ##  6 2024-05-15 kelan-maksamat-elake-etuudet                                 341d…
    ##  7 2024-05-15 maksetut-takuuelakkeet                                       17cd…
    ##  8 2024-05-15 etuuksien-ratkaisut                                          3fec…
    ##  9 2024-05-15 perustoimeentulotuen-saajat                                  af7a…
    ## 10 2024-05-15 kelan-maksaman-perustoimeentulotuen-menot-ja-palautukset     4b64…
    ## 11 2024-05-15 kelan-elake-etuuden-saajat-ja-keskimaaraiset-etuudet         8df7…
    ## 12 2024-05-15 perustoimeentulotuen-saajakotitaloudet                       802e…
    ## 13 2024-05-15 vanhempainpaivarahojen-saajat-ja-maksetut-etuudet            fcec…
    ## 14 2024-05-15 tyomarkkinatuen-saajat-tukipaivien-kertyman-ja-korvausperus… 06fc…
    ## 15 2024-05-15 kelan-tyottomyysetuudet-korvausperusteen-mukaan              3080…
    ## 16 2024-05-15 kelan-tyottomyysetuuksien-saajat-kuukauden-lopussa           4378…
    ## 17 2024-05-15 kunnan-osarahoittaman-tyomarkkinatuen-saajat-ja-maksetut-et… 5dd6…
    ## 18 2024-05-15 koulumatkatuen-saajat-ja-maksetut-tuet                       3937…
    ## 19 2024-05-15 opintotuen-saajat-ja-maksetut-tuet                           6c4d…
    ## 20 2024-05-15 kelan-etuuksien-saajat-ja-maksetut-etuudet                   9af3…
    ## 21 2024-05-15 sairaanhoitokorvausten-saajat-ja-maksetut-korvaukset         2236…
    ## 22 2024-04-22 suomen-tyokyvyttomyyselakkeensaajat-sairauden-mukaan         8be0…
    ## 23 2023-06-19 helsingin-seudun-sairastavuusindeksi                         06f6…

Print first 10 rows of most recently updated data that is Suomen
eläkkeensaajat ja keskimääräiset eläkkeet

``` r
kelaopendata::get_data(data_id = dsets[1,]$id, sql = "LIMIT 10")
```

    ## # A tibble: 10 × 13
    ##    aikatyyppi kuukausi_nro vuosikuukausi vuosi kunta_nro kunta_nimi ikaryhma
    ##    <chr>             <dbl>         <dbl> <dbl> <chr>     <chr>      <chr>   
    ##  1 Kuukausi             12        202012  2020 563       Oulainen   50-54   
    ##  2 Kuukausi             12        202012  2020 563       Oulainen   50-54   
    ##  3 Kuukausi             12        202012  2020 563       Oulainen   50-54   
    ##  4 Kuukausi             12        202012  2020 563       Oulainen   50-54   
    ##  5 Kuukausi             12        202012  2020 563       Oulainen   50-54   
    ##  6 Kuukausi             12        202012  2020 563       Oulainen   50-54   
    ##  7 Kuukausi             12        202012  2020 563       Oulainen   50-54   
    ##  8 Kuukausi             12        202012  2020 563       Oulainen   50-54   
    ##  9 Kuukausi             12        202012  2020 563       Oulainen   50-54   
    ## 10 Kuukausi             12        202012  2020 563       Oulainen   50-54   
    ## # ℹ 6 more variables: sukupuoli <chr>, etuus <chr>, asuinmaa <chr>,
    ## #   elakejarjestelma <chr>, saaja_lkm <dbl>, maksettu_laskenta_eur <dbl>

## Disclaimer

This package is in no way officially related to or endorsed by KELA.
