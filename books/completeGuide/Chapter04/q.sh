 curl -d { "tokenizer": "standard", "text": "Tokenizer breaks characters into tokens!"} 
curl  http://localhost:9200/

curl http://localhost:9200//bigginsight/_search -d'
{
  "query": {
    "match_all": {}
  },
  "size": 1
}
'


curl http://localhost:9200/bigginsight/_search
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


curl http://localhost:9200/bigginsight/_search
{
 "aggregations": {                     
    "download_average": {                
      "avg": {                           
        "field": "downloadTotal"       
      }      
    }
  },
  "size": 0                            
}


curl http://localhost:9200/bigginsight/_search
{
 "aggregations": {                    
    "download_min": {                  
      "min": {                         
        "field": "downloadTotal"       
      }      
    }
  },
  "size": 0                            
}


curl http://localhost:9200/bigginsight/_search
{
 "aggregations": {                    
    "download_max": {                  
      "max": {                         
        "field": "downloadTotal"       
      }      
    }
  },
  "size": 0                            
}


curl http://localhost:9200/bigginsight/_search
{
 "aggregations": {
    "download_stats": {
      "stats": {
        "field": "downloadTotal"
      }
    }
  },
  "size": 0
}


curl http://localhost:9200/bigginsight/_search
{
 "aggregations": {
    "download_estats": {
      "extended_stats": {
        "field": "downloadTotal"
      }
    }
  },
  "size": 0
}


curl http://localhost:9200/bigginsight/_search
{
 "aggregations": {
    "unique_visitors": {
      "cardinality": {
        "field": "username"
      }
    }
  },
  "size": 0
}


curl http://localhost:9200//bigginsight/_search
{
  "aggs": {                           
    "byCategory": {                   
      "terms": {                      
        "field": "category"           
      }
    }
  },
  "size": 0                           
}


curl http://localhost:9200//bigginsight/_search?size=0
{
  "aggs": {
    "byApplication": {
      "terms": {
        "field": "application"
      }
    }
  }
}


curl http://localhost:9200//bigginsight/_search?size=0
{
  "aggs": {
    "byApplication": {
      "terms": {
        "field": "application",
        "size": 15
      }
    }
  }
}

POST /bigginsight/_search?size=0
{
  "aggs": {
    "by_usage": {
      "histogram": {
        "field": "usage",
        "interval": 1000
      }
    }
  }
}


POST /bigginsight/_search?size=0
{
  "aggs": {
    "by_usage": {
      "range": {
        "field": "usage",
        "ranges": [
          { "to": 1024 },
          { "from": 1024, "to": 102400 },
          { "from": 102400 }
        ]
      }
    }
  }
}


POST /bigginsight/_search?size=0
{
  "aggs": {
    "by_usage": {
      "range": {
        "field": "usage",
        "ranges": [
          { "key": "Upto 1 kb", "to": 1024 },
          { "key": "1 kb to 100 kb","from": 1024, "to": 102400 },
          { "key": "100 kb and more", "from": 102400 }
        ]
      }
    }
  }
}


curl http://localhost:9200//bigginsight/_search?size=0
{
  "query": {
    "term": {
      "customer": "Linkedin"
    }
  }, 
  "aggs": {                           
    "byCategory": {                   
      "terms": {                      
        "field": "category"           
      }
    }
  }
}


curl http://localhost:9200//bigginsight/_search?size=0
{
  "query": {
    "bool": {
      "must": [
        {"term": {"customer": "Linkedin"}}, 
        {"range": {"time": {"gte": 1506277800000, "lte": 1506294200000}}}
      ]
    }
  },
  "aggs": {
    "byCategory": {
      "terms": {
        "field": "category"
      }
    }
  }
}


curl http://localhost:9200//bigginsight/_search?size=0
{
  "query": {                                      
    "bool": {
      "must": [
        {"term": {"customer": "Linkedin"}}, 
        {"range": {"time": {"gte": 1506257800000, "lte": 1506314200000}}}
      ]
    }
  },
  "aggs": {
    "by_users": {                                 
      "terms": {
        "field": "username"
      },
      "aggs": {
        "total_usage": {                          
          "sum": { "field": "usage" }
        }
      }
    }
  }
}


curl http://localhost:9200//bigginsight/_search?size=0
{
  "query": {                                                  
    "bool": {
      "must": [
        {"term": {"customer": "Linkedin"}}, 
        {"range": {"time": {"gte": 1506257800000, "lte": 1506314200000}}}
      ]
    }
  },
  "aggs": {
    "by_departments": {                                       
      "terms": { "field": "department" },               
      "aggs": {
        "by_users": {                                         
          "terms": {
            "field": "username",
            "size": 2,                                        
            "order": { "total_usage": "desc"}
          },
          "aggs": {
            "total_usage": {"sum": { "field": "usage" }}      
          }
        }
      }
    }
  }
}


POST /bigginsight/_search?size=0
{
  "aggs": {
    "chat": {
      "filter": {
        "term": {
          "category": "Chat"
        }
      }
    }
  }
}


curl http://localhost:9200/bigginsight/_search?size=0
{
  "aggs": {
    "messages": {
      "filters": {
        "filters": {
          "chat": { "match": { "category": "Chat" }},              
          "skype": { "match": { "application": "Skype" }},         
          "other_than_skype": {                                    
            "bool": {
              "must": {"match": {"category": "Chat"}},
              "must_not": {"match": {"application": "Skype"}}
            }
          }
        }
      }
    }
  }
}


curl http://localhost:9200//bigginsight/_search?size=0       
{
  "aggs": {
    "counts_over_time": {
      "date_histogram": {                         
        "field": "time",
        "interval": "1d"                          
      }
    }
  }
}


curl http://localhost:9200//bigginsight/_search?size=0
{
  "aggs": {
    "counts_over_time": {
      "date_histogram": {
        "field": "time",
        "interval": "1d",
        "time_zone": "+05:30"
      }
    }
  }
}


curl http://localhost:9200//bigginsight/_search?size=0
{
  "query": { "term": {"customer": "Linkedin"} },
  "aggs": {
    "counts_over_time": {
      "date_histogram": {
        "field": "time",
        "interval": "1d",
        "time_zone": "+05:30"
      },
      "aggs": {
        "total_bandwidth": {
          "sum": { "field": "usage" }
        }
      }
    }
  }
}


curl http://localhost:9200//bigginsight/_search?size=0
{
  "query": {
    "bool": {
      "must": [
        {"term": {"customer": "Linkedin"}}, 
        {"range": {"time": {"gte": 1506277800000}}}
      ]
    }
  },
  "aggs": {
    "counts_over_time": {
      "date_histogram": {
        "field": "time",
        "interval": "1h",
        "time_zone": "+05:30"
      },
      "aggs": {
        "hourly_usage": {
          "sum": { "field": "usage" }
        }
      }
    }
  }
}



curl http://localhost:9200/bigginsight/_search?size=0
{
  "aggs": {
    "within_radius": {
      "geo_distance": {
        "field": "location",
        "origin": {"lat": 23.102869,"lon": 72.595692},
        "ranges": [{"to": 5}]
      }
    }
  }
}


curl http://localhost:9200/bigginsight/_search?size=0
{
  "aggs": {
    "within_radius": {
      "geo_distance": {
        "field": "location",
        "origin": {"lat": 23.102869,"lon": 72.595692},
        "ranges": [{"from": 5, "to": 10}]
      }
    }
  }
}


curl http://localhost:9200/bigginsight/_search?size=0
{
  "aggs": {
    "geo_hash": {
      "geohash_grid": {
        "field": "location",
        "precision": 7
      }
    }
  }
}


curl http://localhost:9200//bigginsight/_search?size=0
{
  "query": {
    "bool": {
      "must": [
        {"term": {"customer": "Linkedin"}}, 
        {"range": {"time": {"gte": 1506277800000}}}
      ]
    }
  },
  "aggs": {
    "counts_over_time": {
      "date_histogram": {
        "field": "time",
        "interval": "1h",
        "time_zone": "+05:30"
      },
      "aggs": {
        "hourly_usage": {
          "sum": { "field": "usage" }
        },
        "cumulative_hourly_usage": {            1
          "cumulative_sum": {                   2
              "buckets_path": "hourly_usage"    3 
          }
        }
      }
    }
  }
}








