kelaopendata
================
2024-04-11

Install

``` r
remotes::install_github("rOpenGov/kelaopendata")
```

## List datasets

``` r
library(kelaopendata)
```

    ## Warning: replacing previous import 'ckanr::changes' by 'dplyr::changes' when
    ## loading 'kelaopendata'

``` r
dsets <- list_datasets()
dsets
```

    ## # A tibble: 20 × 3
    ##    name                                                           id    modified
    ##    <chr>                                                          <chr> <chr>   
    ##  1 kuntien-rahoittama-tyomarkkinatuki                             970f… 2024-04…
    ##  2 kelan-maksamat-elake-etuudet                                   341d… 2024-04…
    ##  3 maksetut-yleiset-asumistuet1                                   f80f… 2024-03…
    ##  4 maksetut-takuuelakkeet                                         17cd… 2024-03…
    ##  5 suomen-tyokyvyttomyyselakkeensaajat-sairauden-mukaan           8be0… 2024-04…
    ##  6 perustoimeentulotuen-saajat                                    af7a… 2024-04…
    ##  7 etuuksien-ratkaisut                                            3fec… 2024-03…
    ##  8 kelan-elake-etuuden-saajat-ja-keskimaaraiset-etuudet           8df7… 2024-04…
    ##  9 kelan-maksaman-perustoimeentulotuen-menot-ja-palautukset       4b64… 2024-03…
    ## 10 vanhempainpaivarahojen-saajat-ja-maksetut-etuudet              fcec… 2024-04…
    ## 11 tyomarkkinatuen-saajat-tukipaivien-kertyman-ja-korvausperuste… 06fc… 2024-04…
    ## 12 kelan-tyottomyysetuudet-korvausperusteen-mukaan                3080… 2024-04…
    ## 13 perustoimeentulotuen-saajakotitaloudet                         802e… 2024-03…
    ## 14 kelan-tyottomyysetuuksien-saajat-kuukauden-lopussa             4378… 2024-04…
    ## 15 kunnan-osarahoittaman-tyomarkkinatuen-saajat-ja-maksetut-etuu… 5dd6… 2024-04…
    ## 16 koulumatkatuen-saajat-ja-maksetut-tuet                         3937… 2024-04…
    ## 17 helsingin-seudun-sairastavuusindeksi                           06f6… 2023-06…
    ## 18 opintotuen-saajat-ja-maksetut-tuet                             6c4d… 2024-04…
    ## 19 kelan-etuuksien-saajat-ja-maksetut-etuudet                     9af3… 2024-03…
    ## 20 sairaanhoitokorvausten-saajat-ja-maksetut-korvaukset           2236… 2024-04…

## Metadata

Get metadata

``` r
meta <- get_metadata(data_id = dsets$id[1])
meta[1:4]
```

    ## $profile
    ## [1] "data-package"
    ## 
    ## $name
    ## [1] "kunnan-osarahoittaman-tyomarkkinatuen-saajat-ja-maksetut-etuudet-kunnittain"
    ## 
    ## $title
    ## [1] "Kunnan osarahoittaman työmarkkinatuen saajat ja maksetut etuudet kunnittain"
    ## 
    ## $description
    ## [1] "Tämä tietoaineisto liittyy Kelan tilastotietokanta Kelaston dynaamiseen raporttiin Kunnan osarahoittaman työmarkkinatuen saajat ja maksetut etuudet. Aineisto on summattu kuntatasolle. Rahoittava kunta on työttömän asuinkunta työmarkkinatuen maksupäivänä, ja aluejako on laskutuskuukauden mukainen. Vuositietoja on vuodesta 2006 ja kuukausi- ja vuosikertymätietoja vuodesta 2015 alkaen.\n\nVuoden 2014 tiedoista alkaen kuntatieto määräytyy laskutuskuukauden eli maksukuukautta seuraavan kuukauden mukaisena, ja siksi lakkautettujen kuntien viimeiset joulukuun maksut sisältyvät uuden kunnan tietoihin. \n\nTyömarkkinatuen työttömyysajalta korvattujen päivien viimeisin kertymäluokka (TYOMARKKINATUKIPAIVA_LUOKKA) saa arvoja 'Yhteensä', '300-499', '500-999' ja '1000'. Henkilö on voinut kuulua kuukauden aikana useampaan luokkaan, mutta saajamäärät ja maksetut tuet saadaan aineistosta vain kertaalleen per kuukausi, kun aineistoa rajataan arvolla 'Yhteensä'. \n\nAineistossa on vain se työmarkkinatuki, jonka rahoittamiseen kunnat osallistuvat. Mukana ei ole työllistymistä edistävien palvelujen ajalta maksettua työmarkkinatukea eikä valtion kokonaisuudessaan rahoittamaa työmarkkinatukea. Vuosina 2006 - 2014 kunnat rahoittivat 50 % työttömyysajan työmarkkinatuesta, jos tuen saajan työttömyysajan tukipäivien kertymä oli vähintään 500 päivää. Vuoden 2015 alussa kuntien rahoitusvastuu laajeni vähintään 300 päivää työttömyysajan tukea saaneisiin: kunnan rahoittama osuus on 300 - 999 päivää tukea saaneiden kohdalla 50 % ja vähintään 1 000 päivää tukea saaneiden kohdalla 70 % tuesta.\n\nHenkilö on voinut saada yhden kuukauden tai vuoden aikana tukea useammasta kunnasta, joten koko maan saajamääriä ei pidä ottaa tästä aineistosta vaan vastaavasta koko maan aineistosta.\n"

Resources

``` r
jsonlite::toJSON(meta$resources, pretty = T)
```

    ## [
    ##   {
    ##     "name": "kunnan-osarahoittaman-tyomarkkinatuen-saajat-ja-maksetut-etuudet-kunnittain",
    ##     "path": "data.csv",
    ##     "format": "csv",
    ##     "dialect": {
    ##       "delimiter": ","
    ##     },
    ##     "encoding": "UTF-8",
    ##     "pathType": "local",
    ##     "schema": {
    ##       "fields": [
    ##         {
    ##           "name": "aikatyyppi",
    ##           "type": "string",
    ##           "format": "default",
    ##           "values": ["Kuukausi", "Vuosi", "Vuosikertymä"],
    ##           "description": "Tilaston aikajakso:\nVuosi, vuoden lopun tilanne\nVuosikertymä, kertymä vuoden alusta tilastointikuukauden loppuun\nKuukausi, tilastointikuukauden tilanne"
    ##         },
    ##         {
    ##           "name": "kuukausi_nro",
    ##           "type": "integer",
    ##           "format": "default",
    ##           "values": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12],
    ##           "description": "Tilastointijakson kuukauden numero"
    ##         },
    ##         {
    ##           "name": "vuosikuukausi",
    ##           "type": "integer",
    ##           "format": "default",
    ##           "values": [200612, 200712, 200812, 200912, 201012, 201112, 201212, 201312, 201412, 201501, 201502, 201503, 201504, 201505, 201506, 201507, 201508, 201509, 201510, 201511, 201512, 201601, 201602, 201603, 201604, 201605, 201606, 201607, 201608, 201609, 201610, 201611, 201612, 201701, 201702, 201703, 201704, 201705, 201706, 201707, 201708, 201709, 201710, 201711, 201712, 201801, 201802, 201803, 201804, 201805, 201806, 201807, 201808, 201809, 201810, 201811, 201812, 201901, 201902, 201903, 201904, 201905, 201906, 201907, 201908, 201909, 201910, 201911, 201912, 202001, 202002, 202003, 202004, 202005, 202006, 202007, 202008, 202009, 202010, 202011, 202012, 202101, 202102, 202103, 202104, 202105, 202106, 202107, 202108, 202109, 202110, 202111, 202112, 202201, 202202, 202203, 202204, 202205, 202206, 202207, 202208, 202209, 202210, 202211, 202212, 202301, 202302, 202303, 202304, 202305, 202306, 202307, 202308, 202309, 202310, 202311, 202312, 202401, 202402],
    ##           "description": "Tlastointijakson vuosi ja kuukausi, muotoa VVVVKK"
    ##         },
    ##         {
    ##           "name": "vuosi",
    ##           "type": "integer",
    ##           "format": "default",
    ##           "values": [2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024],
    ##           "description": "Tilastointijakson vuosi"
    ##         },
    ##         {
    ##           "name": "kunta_nro",
    ##           "type": "string",
    ##           "format": "default",
    ##           "values": ["004", "005", "006", "009", "010", "015", "016", "017", "018", "019", "020", "040", "044", "045", "046", "047", "049", "050", "051", "052", "061", "069", "071", "072", "073", "074", "075", "077", "078", "079", "081", "082", "083", "084", "085", "086", "090", "091", "092", "095", "097", "098", "099", "101", "102", "103", "105", "106", "108", "109", "111", "139", "140", "142", "143", "145", "146", "148", "149", "151", "152", "153", "163", "164", "165", "167", "169", "171", "172", "173", "174", "175", "176", "177", "178", "179", "180", "181", "182", "183", "186", "199", "202", "204", "205", "208", "210", "211", "213", "214", "216", "217", "218", "220", "223", "224", "226", "227", "230", "231", "232", "233", "235", "236", "239", "240", "241", "243", "244", "245", "246", "247", "248", "249", "250", "252", "254", "255", "256", "257", "259", "260", "261", "262", "263", "265", "266", "271", "272", "273", "275", "276", "277", "279", "280", "281", "283", "284", "285", "286", "287", "288", "289", "290", "291", "292", "297", "300", "301", "303", "304", "305", "306", "308", "309", "310", "312", "315", "316", "317", "319", "320", "322", "398", "399", "400", "401", "402", "403", "405", "406", "407", "408", "410", "413", "414", "415", "416", "418", "419", "420", "421", "422", "423", "424", "425", "426", "429", "430", "433", "434", "435", "436", "439", "440", "441", "442", "443", "444", "445", "475", "476", "479", "480", "481", "482", "483", "484", "489", "490", "491", "493", "494", "495", "498", "499", "500", "501", "503", "504", "505", "506", "507", "508", "529", "531", "532", "533", "534", "535", "536", "537", "538", "540", "541", "543", "544", "545", "559", "560", "561", "562", "563", "564", "567", "573", "576", "577", "578", "580", "581", "583", "584", "585", "586", "587", "588", "592", "593", "595", "598", "599", "601", "602", "603", "604", "606", "607", "608", "609", "611", "614", "615", "616", "617", "618", "619", "620", "623", "624", "625", "626", "630", "631", "632", "633", "635", "636", "638", "640", "678", "680", "681", "682", "683", "684", "686", "687", "689", "691", "692", "694", "696", "697", "698", "700", "701", "702", "704", "705", "707", "708", "710", "729", "732", "734", "737", "738", "739", "740", "741", "742", "743", "746", "747", "748", "749", "751", "753", "754", "755", "758", "759", "761", "762", "765", "768", "770", "772", "774", "775", "776", "777", "778", "781", "783", "784", "785", "790", "791", "831", "832", "833", "834", "835", "837", "838", "844", "845", "846", "848", "849", "850", "851", "853", "854", "855", "857", "858", "859", "863", "864", "885", "886", "887", "889", "890", "892", "893", "895", "905", "906", "908", "909", "911", "912", "913", "915", "916", "918", "921", "922", "923", "924", "925", "926", "927", "928", "931", "932", "933", "934", "935", "936", "940", "942", "944", "945", "946", "971", "972", "973", "975", "976", "977", "978", "979", "980", "981", "988", "989", "992"],
    ##           "description": "Kunnan numero etuuden maksuhetkellä.\nTilastokeskuksen kuntaluokittelu.\nArvo 199 tarkoittaa, että ryhmän lukumäärä on alle 4 tai tieto puuttuu."
    ##         },
    ##         {
    ##           "name": "kunta_nimi",
    ##           "type": "string",
    ##           "format": "default",
    ##           "values": ["004", "006", "015", "017", "040", "044", "045", "073", "083", "084", "085", "095", "101", "163", "173", "175", "180", "183", "210", "220", "223", "227", "243", "246", "247", "248", "252", "254", "255", "259", "262", "266", "277", "279", "281", "289", "292", "303", "306", "308", "310", "315", "401", "406", "414", "415", "419", "424", "429", "439", "443", "479", "482", "490", "493", "501", "506", "533", "534", "537", "540", "544", "559", "567", "573", "585", "586", "587", "602", "603", "606", "617", "618", "632", "633", "640", "682", "692", "696", "701", "705", "708", "737", "741", "754", "770", "772", "774", "775", "776", "784", "835", "855", "863", "864", "885", "906", "909", "912", "913", "916", "923", "926", "928", "932", "933", "940", "942", "944", "945", "971", "972", "973", "975", "978", "979", "988", "Äänekoski", "Ähtäri", "Akaa", "Alajärvi", "Alavieska", "Alavus", "Asikkala", "Askola", "Aura", "Enonkoski", "Enontekiö", "Espoo", "Eura", "Eurajoki", "Evijärvi", "Forssa", "Haapajärvi", "Haapavesi", "Hailuoto", "Halsua", "Hämeenkoski", "Hämeenkyrö", "Hämeenlinna", "Hamina", "Hankasalmi", "Hanko", "Harjavalta", "Hartola", "Hattula", "Hausjärvi", "Heinävesi", "Heinola", "Helsinki", "Hirvensalmi", "Hollola", "Honkajoki", "Huittinen", "Humppila", "Hyrynsalmi", "Hyvinkää", "Ii", "Iisalmi", "Iitti", "Ikaalinen", "Ilmajoki", "Ilomantsi", "Imatra", "Inari", "Inkoo", "Isojoki", "Isokyrö", "Jalasjärvi", "Jämijärvi", "Jämsä", "Janakkala", "Järvenpää", "Joensuu", "Jokioinen", "Joroinen", "Joutsa", "Juankoski", "Juuka", "Juupajoki", "Juva", "Jyväskylä", "Kaarina", "Kaavi", "Kajaani", "Kalajoki", "Kangasala", "Kangasniemi", "Kankaanpää", "Kannonkoski", "Kannus", "Karijoki", "Karkkila", "Kärkölä", "Kärsämäki", "Karstula", "Karvia", "Kaskinen", "Kauhajoki", "Kauhava", "Kauniainen", "Kaustinen", "Keitele", "Kemi", "Kemijärvi", "Keminmaa", "Kemiönsaari", "Kempele", "Kerava", "Keuruu", "Kihniö", "Kinnula", "Kirkkonummi", "Kitee", "Kittilä", "Kiuruvesi", "Kivijärvi", "Kokemäki", "Kokkola", "Kolari", "Konnevesi", "Kontiolahti", "Korsnäs", "Koski Tl", "Kotka", "Kouvola", "Köyliö", "Kristiinankaupunki", "Kruunupyy", "Kuhmo", "Kuhmoinen", "Kuopio", "Kuortane", "Kurikka", "Kustavi", "Kuusamo", "Kyyjärvi", "Lahti", "Laihia", "Laitila", "Lapinjärvi", "Lapinlahti", "Lappajärvi", "Lappeenranta", "Lapua", "Laukaa", "Lavia", "Lemi", "Lempäälä", "Leppävirta", "Lestijärvi", "Lieksa", "Lieto", "Liminka", "Liperi", "Lohja", "Loimaa", "Loppi", "Loviisa", "Luhanka", "Lumijoki", "Luoto", "Luumäki", "Luvia", "Maalahti", "Maaninka", "Mäntsälä", "Mänttä-Vilppula", "Mäntyharju", "Marttila", "Masku", "Merijärvi", "Merikarvia", "Miehikkälä", "Mikkeli", "Muhos", "Multia", "Muonio", "Mustasaari", "Muurame", "Mynämäki", "Myrskylä", "Naantali", "Nakkila", "Närpiö", "Nastola", "Nivala", "Nokia", "Nousiainen", "Nurmes", "Nurmijärvi", "Orimattila", "Oripää", "Orivesi", "Oulainen", "Oulu", "Outokumpu", "Padasjoki", "Paimio", "Pälkäne", "Paltamo", "Parainen", "Parikkala", "Parkano", "Pedersören kunta", "Pelkosenniemi", "Pello", "Perho", "Pertunmaa", "Petäjävesi", "Pieksämäki", "Pielavesi", "Pietarsaari", "Pihtipudas", "Pirkkala", "Polvijärvi", "Pomarkku", "Pori", "Pornainen", "Porvoo", "Posio", "Pöytyä", "Pudasjärvi", "Pukkila", "Punkalaidun", "Puolanka", "Puumala", "Pyhäjärvi", "Pyhäjoki", "Pyhäntä", "Pyhäranta", "Pyhtää", "Raahe", "Rääkkylä", "Raasepori", "Raisio", "Rantasalmi", "Ranua", "Rauma", "Rautalampi", "Rautavaara", "Rautjärvi", "Reisjärvi", "Riihimäki", "Ristijärvi", "Rovaniemi", "Ruokolahti", "Ruovesi", "Rusko", "Saarijärvi", "Säkylä", "Salla", "Salo", "Sastamala", "Sauvo", "Savitaipale", "Savonlinna", "Savukoski", "Seinäjoki", "Sievi", "Siikainen", "Siikajoki", "Siikalatva", "Siilinjärvi", "Simo", "Sipoo", "Siuntio", "Sodankylä", "Soini", "Somero", "Sonkajärvi", "Sotkamo", "Sulkava", "Suomussalmi", "Suonenjoki", "Sysmä", "Taipalsaari", "Taivalkoski", "Taivassalo", "Tammela", "Tampere", "Tarvasjoki", "Tervo", "Tervola", "Teuva", "Tohmajärvi", "Toholampi", "Toivakka", "Tornio", "Tuntematon", "Turku", "Tuusniemi", "Tuusula", "Tyrnävä", "Ulvila", "Urjala", "Utajärvi", "Utsjoki", "Uurainen", "Uusikaarlepyy", "Uusikaupunki", "Vaala", "Vaasa", "Valkeakoski", "Valtimo", "Vantaa", "Varkaus", "Vehmaa", "Vesanto", "Vesilahti", "Veteli", "Vieremä", "Vihti", "Viitasaari", "Vimpeli", "Virolahti", "Virrat", "Vöyri", "Ylitornio", "Ylivieska", "Ylöjärvi", "Ypäjä"],
    ##           "description": "Kunnan nimi etuuden maksuhetkellä.\r\nTilastokeskuksen kuntaluokittelu.\r\n(Huom! Ennen vuotta 2014 lakanneiden kuntien nimet näkyvät aineistossa kuntanumerona).\r\n'Tuntematon' tarkoittaa, että kuntatasolla saajien lukumäärä on alle 4 tai kuntatieto puuttuu."
    ##         },
    ##         {
    ##           "name": "ikaryhma",
    ##           "type": "string",
    ##           "format": "default",
    ##           "values": ["17-19", "20-24", "25-29", "30-34", "35-39", "40-44", "45-49", "50-54", "55-59", "60-64", "65-67", "Tieto puuttuu"],
    ##           "description": "Saajan ikäryhmä tilastointijakson lopussa:\n17-19, 20-24, 25-29,…, 60-64 ja 65-67\nTieto puuttuu, ryhmän lukumäärä on alle 4 tai tieto puuttuu"
    ##         },
    ##         {
    ##           "name": "sukupuoli",
    ##           "type": "string",
    ##           "format": "default",
    ##           "values": ["Mies", "Nainen", "Tuntematon"],
    ##           "description": "Sukupuoli:\nMies\nNainen\nTuntematon, ryhmän lukumäärä on alle 4 tai tieto puuttuu"
    ##         },
    ##         {
    ##           "name": "tyomarkkinatukipaiva_luokka",
    ##           "type": "string",
    ##           "format": "default",
    ##           "values": ["1000 tai yli", "300-499", "500-999", "Yhteensä"],
    ##           "description": "Työmarkkinatuen työttömyysajalta korvattujen päivien viimeisin kertymäluokka tilastointiajanjakson lopussa\n300-499                                                                                                                 \n500-999                                                                                                                 \n1000 tai yli\nYhteensä"
    ##         },
    ##         {
    ##           "name": "saaja_lkm",
    ##           "type": "number",
    ##           "format": "default",
    ##           "values": [0, 1985],
    ##           "description": "Saajien lukumäärä"
    ##         },
    ##         {
    ##           "name": "korvattu_paiva_lkm",
    ##           "type": "number",
    ##           "format": "default",
    ##           "values": [-13569, 400069],
    ##           "description": "Korvattujen päivien lukumäärä"
    ##         },
    ##         {
    ##           "name": "maksettu_eur",
    ##           "type": "number",
    ##           "format": "default",
    ##           "values": [-37969.5, 13935926.61],
    ##           "description": "Maksetun etuuden rahamäärä bruttona, palautuksissa saa negatiivisen arvon"
    ##         },
    ##         {
    ##           "name": "kunta_osuus_eur",
    ##           "type": "number",
    ##           "format": "default",
    ##           "values": [-24147.26, 8755773.47],
    ##           "description": "Rahamäärä, jolla kunta on osarahoittanut työmarkkinatuen maksua, palautuksissa saa negatiivisen arvon"
    ##         }
    ##       ],
    ##       "missingValues": [""]
    ##     },
    ##     "profile": "data-resource"
    ##   }
    ## ]

## Download data

Get first 10 rows of data

``` r
get_data(data_id = dsets$id[1], sql = "LIMIT 10")
```

    ## # A tibble: 10 × 13
    ##    aikatyyppi kuukausi_nro vuosikuukausi vuosi kunta_nro kunta_nimi ikaryhma    
    ##    <chr>             <dbl>         <dbl> <dbl> <chr>     <chr>      <chr>       
    ##  1 Kuukausi              1        202201  2022 992       Äänekoski  Tieto puutt…
    ##  2 Kuukausi              1        202201  2022 980       Ylöjärvi   Tieto puutt…
    ##  3 Kuukausi              1        202201  2022 977       Ylivieska  Tieto puutt…
    ##  4 Kuukausi              1        202201  2022 946       Vöyri      Tieto puutt…
    ##  5 Kuukausi              1        202201  2022 934       Vimpeli    Tieto puutt…
    ##  6 Kuukausi              1        202201  2022 927       Vihti      Tieto puutt…
    ##  7 Kuukausi              1        202201  2022 925       Vieremä    Tieto puutt…
    ##  8 Kuukausi              1        202201  2022 924       Veteli     Tieto puutt…
    ##  9 Kuukausi              1        202201  2022 922       Vesilahti  Tieto puutt…
    ## 10 Kuukausi              1        202201  2022 921       Vesanto    Tieto puutt…
    ## # ℹ 6 more variables: sukupuoli <chr>, tyomarkkinatukipaiva_luokka <chr>,
    ## #   saaja_lkm <dbl>, korvattu_paiva_lkm <dbl>, maksettu_eur <dbl>,
    ## #   kunta_osuus_eur <dbl>

Whole dataset

``` r
whole_data <- get_data(data_id = dsets$id[1])
whole_data
```

    ## # A tibble: 2,070,511 × 13
    ##    aikatyyppi kuukausi_nro vuosikuukausi vuosi kunta_nro kunta_nimi ikaryhma    
    ##    <chr>             <dbl>         <dbl> <dbl> <chr>     <chr>      <chr>       
    ##  1 Kuukausi              1        202201  2022 992       Äänekoski  Tieto puutt…
    ##  2 Kuukausi              1        202201  2022 980       Ylöjärvi   Tieto puutt…
    ##  3 Kuukausi              1        202201  2022 977       Ylivieska  Tieto puutt…
    ##  4 Kuukausi              1        202201  2022 946       Vöyri      Tieto puutt…
    ##  5 Kuukausi              1        202201  2022 934       Vimpeli    Tieto puutt…
    ##  6 Kuukausi              1        202201  2022 927       Vihti      Tieto puutt…
    ##  7 Kuukausi              1        202201  2022 925       Vieremä    Tieto puutt…
    ##  8 Kuukausi              1        202201  2022 924       Veteli     Tieto puutt…
    ##  9 Kuukausi              1        202201  2022 922       Vesilahti  Tieto puutt…
    ## 10 Kuukausi              1        202201  2022 921       Vesanto    Tieto puutt…
    ## # ℹ 2,070,501 more rows
    ## # ℹ 6 more variables: sukupuoli <chr>, tyomarkkinatukipaiva_luokka <chr>,
    ## #   saaja_lkm <dbl>, korvattu_paiva_lkm <dbl>, maksettu_eur <dbl>,
    ## #   kunta_osuus_eur <dbl>

Subset only men from municipality Veteli from year 2023

``` r
veteli23 <- get_data(data_id = dsets$id[1], sql = "WHERE kunta_nro = 924 AND vuosi = 2023 AND sukupuoli = 'Mies'")
veteli23
```

    ## # A tibble: 99 × 13
    ##    aikatyyppi   kuukausi_nro vuosikuukausi vuosi kunta_nro kunta_nimi ikaryhma  
    ##    <chr>               <dbl>         <dbl> <dbl> <chr>     <chr>      <chr>     
    ##  1 Vuosikertymä            8        202308  2023 924       Veteli     Tieto puu…
    ##  2 Vuosikertymä            9        202309  2023 924       Veteli     Tieto puu…
    ##  3 Vuosikertymä           10        202310  2023 924       Veteli     Tieto puu…
    ##  4 Kuukausi                5        202305  2023 924       Veteli     Tieto puu…
    ##  5 Vuosikertymä           12        202312  2023 924       Veteli     Tieto puu…
    ##  6 Vuosikertymä           11        202311  2023 924       Veteli     Tieto puu…
    ##  7 Vuosikertymä            8        202308  2023 924       Veteli     60-64     
    ##  8 Vuosikertymä            8        202308  2023 924       Veteli     55-59     
    ##  9 Vuosikertymä            9        202309  2023 924       Veteli     60-64     
    ## 10 Vuosikertymä            9        202309  2023 924       Veteli     55-59     
    ## # ℹ 89 more rows
    ## # ℹ 6 more variables: sukupuoli <chr>, tyomarkkinatukipaiva_luokka <chr>,
    ## #   saaja_lkm <dbl>, korvattu_paiva_lkm <dbl>, maksettu_eur <dbl>,
    ## #   kunta_osuus_eur <dbl>
