And here's the walkthrough of how I did this. It's rough and hacky, but gives us a foundation. I think I will close this for now. As we get new collections, I'll run on them too. 

## 1: Assemble the URL Lists

Use the warcbase workflow to extract URLs, akin to:

```scala
import org.warcbase.spark.matchbox._
import org.warcbase.spark.rdd.RecordRDD._

val r = RecordLoader.loadArchives("/directory/to/arc/file.arc.gz", sc) 
.keepValidPages()
.map(r => r.getUrl)
.saveAsTextFile("/path/to/export/directory/")
```

## 2: Put into format for Crawl Visualization

Right now, we've got a layout incompatibility. This (lazy person's) code works:

```bash
sed -i -- 's/((//g' *
sed -i -- 's/,/ /g' *
sed -i -- 's/)//g' *
```

## 3: Process

Run this script in the directory with the fixed URLs, changing paths as necessary.

```
#!/bin/bash
for filename in *.txt; do
    filenameshort=${filename/-all.txt/}
    echo $filenameshort
    cp $filename /Users/ianmilligan1/dropbox/git/WALK-CrawlVis/crawl-sites/raw.txt
    python2 /Users/ianmilligan1/dropbox/git/WALK-CrawlVis/crawl-sites/process.py > /Users/ianmilligan1/dropbox/git/WALK-CrawlVis/crawl-sites/$filenameshort.csv
    sed "s/data.csv/$filenameshort.csv/g" /Users/ianmilligan1/dropbox/git/WALK-CrawlVis/crawl-sites/index.html > /Users/ianmilligan1/dropbox/git/WALK-CrawlVis/crawl-sites/$filenameshort.html
done
```

What does it do? It goes into each file, processes them, creates a datafile and an index file pointing at said datafile.

Not pretty, but works right now.

## 4: Results

You can find them on the main README.md page.