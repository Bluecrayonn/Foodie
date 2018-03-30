var mapFunction2 = function() {
                       for (var idx = 0; idx < this.ingredients.length; idx++) {
                           var key = this.ingredients[idx].name;
                           var value = {
                                         count: 1
                                        
                                       };
                           emit(key, value);
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
                    
db.ingredients.mapReduce( mapFunction2,
                     reduceFunction2,
                     {
                       out: { merge: "map_reduce_example" },
                       
                       finalize: finalizeFunction2
                     }
                   )                    