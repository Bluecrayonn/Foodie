 var collections = db.getCollectionNames();
 collections;
 
var mapFunction2 = function() {
   
  
 for (var idx in this.keywords ) {
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
                       };
  
   
                        
 
  
  
                      
                    };
var reduceFunction2 = function(key, countObjVals) {
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
                  
 for(var i =0;i<collections.length ; i++){
   var regex=/^search_log_/;
   var collectionName = collections[i];
   if(collectionName.match(regex)!=null){
      db.getCollection(collectionName).mapReduce( mapFunction2,
                     reduceFunction2,
                     {
                      
                       out: { merge: "Mapout4" }
                       
                       
                     }
                   )     
                   
                   
                   
   }
    }
      
                    

                   
      