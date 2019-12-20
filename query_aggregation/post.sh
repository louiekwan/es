 #curl  -H 'Content-Type: application/json' 127.0.0.1:9200/_analyze -XPOST \
 #-d '{"tokenizer": "standard", "text": "Tokenizer breaks characters into a list of tokens!"}' 
 #curl  -H 'Content-Type: application/json' 127.0.0.1:9200/index_standard_analyzer -XPOST \
 curl  -H 'Content-Type: application/json' 127.0.0.1:9200/_analyze -XPOST \
 -d '{"analyzer": "standard", "text": "Tokenizer breaks characters into a list of tokens!"}' 
