#!/bin/sh

cd raw

# DOWNLOAD PRISM FILES (can't use loop because of the Dropbox SHAs)
wget -O year2022.xlsx "https://www.countyhealthrankings.org/sites/default/files/media/document/2022%20County%20Health%20Rankings%20Data%20-%20v1.xlsx"
sleep 20
wget -O year2021.xlsx "https://www.countyhealthrankings.org/sites/default/files/media/document/2021%20County%20Health%20Rankings%20Data%20-%20v1.xlsx"
sleep 20
wget -O year2020.xlsx "https://www.countyhealthrankings.org/sites/default/files/media/document/2020%20County%20Health%20Rankings%20Data%20-%20v2.xlsx"
sleep 20
wget -O year2019.xls  "https://www.countyhealthrankings.org/sites/default/files/media/document/2019%20County%20Health%20Rankings%20Data%20-%20v3.xls"
sleep 20
wget -O year2018.xls  "https://www.countyhealthrankings.org/sites/default/files/2018%20County%20Health%20Rankings%20Data%20-%20v2.xls"
sleep 20
wget -O year2017.xls  "https://www.countyhealthrankings.org/sites/default/files/2017CountyHealthRankingsData.xls"
sleep 20
wget -O year2016.xls  "https://www.countyhealthrankings.org/sites/default/files/2016%20County%20Health%20Rankings%20Data%20-%20v3.xls"
sleep 20
wget -O year2015.xls  "https://www.countyhealthrankings.org/sites/default/files/2015%20County%20Health%20Rankings%20Data%20-%20v3.xls"
sleep 20
wget -O year2014.xls  "https://www.countyhealthrankings.org/sites/default/files/2014%20County%20Health%20Rankings%20Data%20-%20v6.xls"
sleep 20
wget -O year2013.xls  "https://www.countyhealthrankings.org/sites/default/files/2013CountyHealthRankingsNationalData.xls"
sleep 20
wget -O year2012.xls  "https://www.countyhealthrankings.org/sites/default/files/2012%20County%20Health%20Rankings%20National%20Data_v2_0.xls"
sleep 20
wget -O year2011.xls  "https://www.countyhealthrankings.org/sites/default/files/2011%20County%20Health%20Rankings%20National%20Data_v2_0.xls"
sleep 20
wget -O year2010.xls  "https://www.countyhealthrankings.org/sites/default/files/2010%20County%20Health%20Rankings%20National%20Data_v2.xls"
sleep 20

cd ..

