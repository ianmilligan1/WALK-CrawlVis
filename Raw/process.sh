#!/bin/bash
for filename in *.txt; do
    filenameshort=${filename/.txt/}
    echo $filenameshort
    cp $filename /Users/ianmilligan1/dropbox/git/WALK-CrawlVis/crawl-sites/raw.txt
    python2 /Users/ianmilligan1/dropbox/git/WALK-CrawlVis/crawl-sites/process.py > /Users/ianmilligan1/dropbox/git/WALK-CrawlVis/crawl-sites/$filenameshort.csv
    sed "s/data.csv/$filenameshort.csv/g" /Users/ianmilligan1/dropbox/git/WALK-CrawlVis/crawl-sites/index.html > /Users/ianmilligan1/dropbox/git/WALK-CrawlVis/crawl-sites/$filenameshort.html
done

