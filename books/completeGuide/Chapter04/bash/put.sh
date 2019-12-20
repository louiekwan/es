#curl -XGET http://localhost:9200/bigginsight/_search -d' { "query": { "match_all": {} }, "size": 1 } '  -H 'Content-Type: application/json' | jq
curl -H 'Content-Type: application/json' -XPUT 'localhost:9200/bigginsight' -d'
{
  "settings": {
    "index": {
      "number_of_replicas": "1",
      "number_of_shards": "5"
    }
  },
  "mappings": {
    "properties": {
      "accessPointId": {
        "type": "keyword",
        "fields": {
          "analyzed": {
            "type": "text"
          }
        }
      },
      "application": {
        "type": "keyword",
        "fields": {
          "analyzed": {
            "type": "text"
          }
        }
      },
      "band": {
        "type": "keyword",
        "fields": {
          "analyzed": {
            "type": "text"
          }
        }
      },
      "bandwidth": {
        "type": "double"
      },
      "category": {
        "type": "keyword",
        "fields": {
          "analyzed": {
            "type": "text"
          }
        }
      },
      "customer": {
        "type": "keyword",
        "fields": {
          "analyzed": {
            "type": "text"
          }
        }
      },
      "department": {
        "type": "keyword",
        "fields": {
          "analyzed": {
            "type": "text"
          }
        }
      },
      "downloadCurrent": {
        "type": "double"
      },
      "downloadTotal": {
        "type": "integer"
      },
      "inactiveMs": {
        "type": "integer"
      },
      "location": {
        "type": "geo_point"
      },
      "mac": {
        "type": "keyword",
        "fields": {
          "analyzed": {
            "type": "text"
          }
        }
      },
      "networkId": {
        "type": "keyword",
        "fields": {
          "analyzed": {
            "type": "text"
          }
        }
      },
      "signalStrength": {
        "type": "integer"
      },
      "time": {
        "type": "date",
        "format": "strict_date_optional_time||epoch_millis"
      },
      "uploadCurrent": {
        "type": "double"
      },
      "uploadTotal": {
        "type": "integer"
      },
      "usage": {
        "type": "double"
      },
      "username": {
        "type": "keyword",
        "fields": {
          "analyzed": {
            "type": "text"
          }
        }
      }
    }
  }
}
'
