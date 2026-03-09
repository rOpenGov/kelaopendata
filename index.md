# kelaopendata - Access open data from National social insurance institution of Finland

Finnish national social insurance institution
[Kela](https://www.kela.fi/) publishes open data on recipients,
reimbursements and costs of various social security benefits in Finland
at <https://avoindata.suomi.fi/data/fi/organization/kela>.
`kelaopendata` package utilizes modern big data technologies such as
[duckdb](https://duckdb.org/) and [Apache
Parquet](https://parquet.apache.org/) and provides fast and
straightforward access to data.

Below is an example of how you can access data using `kelaopendata`.
Please see the
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

``` R
## # A tibble: 30 × 3
##    modified   name                                                         id   
##    <date>     <chr>                                                        <chr>
##  1 2026-03-02 sairaanhoitokorvausten-saajat-ja-maksetut-korvaukset         2236…
##  2 2026-02-26 lastenhoidon-tukien-saajat-ja-maksetut-tuet                  eb0c…
##  3 2026-02-16 maksetut-yleiset-asumistuet1                                 f80f…
##  4 2026-02-16 takuuelakkeen-saajat-ja-keskimaaraiset-elakkeet              53d5…
##  5 2026-02-16 kunnan-osarahoittaman-tyottomyysturvan-saajat-ja-maksetut-e… 6090…
##  6 2026-02-16 etuuksien-ratkaisun-kooste                                   a11f…
##  7 2026-02-16 sairauspaivarahojen-saajat-ja-maksetut-etuudet-sairauspaary… a2ce…
##  8 2026-02-16 kelan-elake-etuuden-saajat-ja-keskimaaraiset-etuudet         8df7…
##  9 2026-02-16 sairauspaivarahojen-saajat-ja-maksetut-etuudet-diagnooseitt… dd43…
## 10 2026-02-16 kelan-tyottomyysetuudet-korvausperusteen-mukaan              3080…
## 11 2026-02-16 kunnan-osarahoittaman-tyottomyysturvan-saajat-ja-maksetut-e… 4eea…
## 12 2026-02-16 koulumatkatuen-saajat-ja-maksetut-tuet                       3937…
## 13 2026-02-16 opintotuen-saajat-ja-maksetut-tuet                           6c4d…
## 14 2026-02-15 kuntien-rahoittama-tyomarkkinatuki                           970f…
## 15 2026-02-15 kelan-maksamat-elake-etuudet                                 341d…
## 16 2026-02-15 maksetut-takuuelakkeet                                       17cd…
## 17 2026-02-15 voimassa-olleet-alkaneet-ja-paattyneet-laakekorvausoikeudet  7083…
## 18 2026-02-15 suomen-tyokyvyttomyyselakkeensaajat-sairauden-mukaan         8be0…
## 19 2026-02-15 perustoimeentulotuen-saajat                                  af7a…
## 20 2026-02-15 kelan-maksaman-perustoimeentulotuen-menot-ja-palautukset     4b64…
## 21 2026-02-15 suomen-elakkeensaajat-ja-keskimaaraiset-elakkeet             e88d…
## 22 2026-02-15 perustoimeentulotuen-saajakotitaloudet                       802e…
## 23 2026-02-15 vanhempainpaivarahojen-saajat-ja-maksetut-etuudet            fcec…
## 24 2026-02-15 tyomarkkinatuen-saajat-tukipaivien-kertyman-ja-korvausperus… 06fc…
## 25 2026-02-15 kunnan-osarahoittaman-tyottomyysturvan-saajat-ja-maksetut-e… 7c07…
## 26 2026-02-15 kelan-tyottomyysetuuksien-saajat-kuukauden-lopussa           4378…
## 27 2026-02-15 kunnan-osarahoittaman-tyomarkkinatuen-saajat-ja-maksetut-et… 5dd6…
## 28 2026-02-15 kelan-etuuksien-saajat-ja-maksetut-etuudet                   9af3…
## 29 2025-12-11 etuuksien-ratkaisut                                          3fec…
## 30 2025-05-14 helsingin-seudun-sairastavuusindeksi                         06f6…
```

Print first 10 rows of most recently updated data that is
Sairaanhoitokorvausten saajat ja maksetut korvaukset

``` r
kelaopendata::get_data(data_id = dsets[1,]$id, sql = "LIMIT 10")
```

``` R
## # A tibble: 10 × 14
##    aikatyyppi kuukausi_nro vuosikuukausi vuosi kunta_nro kunta_nimi ikaryhma
##    <chr>             <dbl>         <dbl> <dbl> <chr>     <chr>      <chr>   
##  1 Kuukausi              1        202601  2026 245       Kerava     5-9     
##  2 Kuukausi              1        202601  2026 245       Kerava     5-9     
##  3 Kuukausi              1        202601  2026 245       Kerava     5-9     
##  4 Kuukausi              1        202601  2026 245       Kerava     5-9     
##  5 Kuukausi              1        202601  2026 245       Kerava     5-9     
##  6 Kuukausi              1        202601  2026 245       Kerava     5-9     
##  7 Kuukausi              1        202601  2026 245       Kerava     5-9     
##  8 Kuukausi              1        202601  2026 245       Kerava     5-9     
##  9 Kuukausi              1        202601  2026 245       Kerava     5-9     
## 10 Kuukausi              1        202601  2026 245       Kerava     5-9     
## # ℹ 7 more variables: sukupuoli <chr>, etuuslaji <chr>, saaja_lkm <dbl>,
## #   korvaus_eur <dbl>, kustannus_eur <dbl>, omavastuukerta_lkm <dbl>,
## #   toimitus_lkm <dbl>
```

Also, there is a web application at <https://kelaopendata.vaphana.com/>
that can be used to browse this data resource.

## Disclaimer

This package is in no way officially related to or endorsed by KELA.
