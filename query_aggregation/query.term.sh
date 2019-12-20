curl  -H 'Content-Type: application/json' \
-XGET '127.0.0.1:9200/shakespeare/_search?pretty' -d '
{
  "query" : {
    "match" : {
       "text_entry" : "Is fresh about me."
    }
  }
}
'
#    "match_phrase" : {
#      "text_entry.raw" : "troubled heaven,"
#      "speaker" : "KING HENRY IV",
