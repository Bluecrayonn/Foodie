var mapFunction2 = function() {
						var d = new Date();
                       for (var idx = 0; idx < this.keywords.length; idx++) {
                         if(this.time_line > d - 60*60*24*1000 ){
                           var key = this.keywords[idx];
                           
                           var value = {
                                   total : 1,
                                   F:0,
                                   M:0,
                                   U:0,
                                   };
                                   if(this.gender=="M"){
                                     value.M = 1;
                                   }else if(this.gender=="F"){
                                     value.F = 1;
                                   }else if(this.gender=="U"){
                                     value.U = 1;
                                   }
                          
                           emit(key, value);
                         }
                       }
                    };
var reduceFunction2 = function(keySKU, countObjVals) {
	 var reducedVal =  {
             total : 0,
             F:0,
             M:0,	
             U:0,
             };
       for (var idx = 0; idx < countObjVals.length; idx++) {
           reducedVal.total  += countObjVals[idx].total ;
           reducedVal.F  += countObjVals[idx].F ;
           reducedVal.M  += countObjVals[idx].M ;
           reducedVal.U  += countObjVals[idx].U ;
            
       };

                     return reducedVal;
                  };             
                  
var finalizeFunction2 = function (key, reducedVal) {

                       reducedVal.count =  reducedVal.count;

                       return reducedVal;

                    };       
                    

db['search_log_2018-04-01'].mapReduce( mapFunction2,
                     reduceFunction2,
                     { 
                       out: { inline:0},
                       sort:{'value':-1},
                       finalize: finalizeFunction2
                     });