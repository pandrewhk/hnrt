nyc200.json:
	twurl '/1.1/statuses/user_timeline.json?screen_name=newsycombinator&count=200' > $@

nyc200.tsv: nyc200.json
	cat nyc200.json|jq -r '.[]|[.id_str,.entities.urls[-1].expanded_url]|@tsv' > $@

hntop.json:
	curl -s 'https://hacker-news.firebaseio.com/v0/topstories.json' -o $@

hn200.urls: hntop.json
	cat hntop.json|\
	jq -j '.[]|"https://hacker-news.firebaseio.com/v0/item/",.,".json\n"'\
	|head -n200 > $@

hn200.json: hn200.urls
	cat hn200.urls|xargs curl --parallel-max 5 > $@

hn200.tsv: hn200.json
	cat hn200.json|jq -r 'select(.url)|[.id,.title,.url]|@tsv' > $@

twemb.html: rematch.tsv #tw.json
	cat rematch.tsv|cut -f1,2|tr '\t' '\n'|twemb > $@
#	cat tw.json|jq -r .id_str|twemb > $@

tw.html: tw.js h twemb.html f
	cat tw.js h twemb.html f > $@

rematch.tsv: nyc200.tsv
	cat nyc200.tsv|while read a b;do echo "$$a\t`url2tw $$b|jq -r .id_str`\t$$b";done > $@
