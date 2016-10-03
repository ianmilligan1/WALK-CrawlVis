#!/bin/bash
for filename in *.txt; do
    filenameshort=${filename/.txt/}
    echo $filenameshort
    cp $filename /home/ubuntu/WALK-CrawlVis/crawl-sites/raw.txt
    python2 /home/ubuntu/WALK-CrawlVis/crawl-sites/process.py > /home/ubuntu/WALK-CrawlVis/crawl-sites/$filenameshort.csv
    sed "s/data.csv/$filenameshort.csv/g" /home/ubuntu/WALK-CrawlVis/crawl-sites/index.html > /home/ubuntu/WALK-CrawlVis/crawl-sites/$filenameshort.html
done

