#curl  -H 'Content-Type: application/json' \
#-XGET '127.0.0.1:9200/shakespeare/_search?pretty' -d '
#{
  #"query" : {
    #"range" : {
    	#"line_id" : {
		#"gte": 104,
		#"lte": 104,
		#"boost": 1.99
	#}
    #}
  #}
#}
#'
curl  -H 'Content-Type: application/json' \
-XGET '127.0.0.1:9200/shakespeare/_search?pretty' -d '
{
  "query" : {
    "range" : {
    	"speech_number" : {
		"gte": 10,
		"lte": 10,
		"boost": 1.99
	}
    }
  }
}
'
