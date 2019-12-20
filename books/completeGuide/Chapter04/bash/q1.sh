#curl -XGET http://localhost:9200/bigginsight/_search -d' { "query": { "match_all": {} }, "size": 1 } '  -H 'Content-Type: application/json' | jq
curl -H 'Content-Type: application/json' -XGET http://localhost:9200/bigginsight/_search -d'
{
	 "aggregations": {
	     "download_sum": {
	     "sum": {
	     "field": "downloadTotal"
     }
         }
	   },
	     "size": 0
     }

' 
