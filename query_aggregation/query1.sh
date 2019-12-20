curl  -H 'Content-Type: application/json' \
-XGET '127.0.0.1:9200/shakespeare/_search?pretty' -d '
{
  "query" : {
    "match_phrase" : { "text_entry" : "be or not to be" }
  }
}
'
