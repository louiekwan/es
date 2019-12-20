#curl -H 'Content-Type: application/json' -XGET '127.0.0.1:9200/shakespeare/_search?pretty' -d ' { "query" : { "match_phrase" : { "text_entry" : "to be or not to be" } } } '
#curl -H 'Content-Type: application/json' -XGET '127.0.0.1:9200/_nodes/plugins'?pretty
#cd /usr/share/elasticsearch/bin/
sudo /usr/share/elasticsearch/bin/plugin -install mobz/elasticsearch-head
