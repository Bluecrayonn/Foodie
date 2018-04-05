var mapFunction2 = function() {
						var d = new Date();
                       for (var idx = 0; idx < this.keywords.length; idx++) {
                         if(this.time_line> d - 1000 ){
                           var key = this.keywords[idx];
                           var value = {
                                         count: 1
                                        
                                       };
                           emit(key, value);
                         }
                       }
                    };
var reduceFunction2 = function(keySKU, countObjVals) {
                     reducedVal = { count: 0 };

                     for (var idx = 0; idx < countObjVals.length; idx++) {
                         reducedVal.count += countObjVals[idx].count;
                          
                     }

                     return reducedVal;
                  };             
                  
var finalizeFunction2 = function (key, reducedVal) {

                       reducedVal.count =  reducedVal.count;

                       return reducedVal;

                    };       
                    

db['search_log_2018-04-01'].mapReduce( mapFunction2,
                     reduceFunction2,
                     { 
                       out: { merge: "map_reduce_example" },
                       
                       finalize: finalizeFunction2
                     });