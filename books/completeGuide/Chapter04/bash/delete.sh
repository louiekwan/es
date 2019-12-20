#curl -XGET http://localhost:9200/bigginsight/_search -d' { "query": { "match_all": {} }, "size": 1 } '  -H 'Content-Type: application/json' | jq

curl -XDELETE 'localhost:9200/bigginsight'
