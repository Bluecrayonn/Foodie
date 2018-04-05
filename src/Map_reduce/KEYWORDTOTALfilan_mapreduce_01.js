var mapFunction2 = function() {
   
  
 for (var idx in this.keywords ) {
                           var key = this.keywords[idx];
                           var value = {
                           total : 1,
                           F:0,
                           M:0,
                           U:0,
                           s20:0,
                           s30:0,
                           s40:0,
                           s50:0,
                           s60:0,
                           sUnk:0

                           };
                           var fullYear = new Date().getFullYear();
                           if(this.gender=="M"){
                             value.M = 1;
                           }else if(this.gender=="F"){
                             value.F = 1;
                           }else if(this.gender=="U"){
                             value.U = 1;
                           }
                           if(fullyear -this.age<20){
                           value.sUnk=1;
                           }else if(fullYear - this.age<30 && fullYear - this.age>=20){
                             value.s20=1;
                           }else if(fullYear - this.age<40 & fullYear - this.age>=30){
                             value.s30=1;
                           }else if(fullYear - this.age<50 & fullYear - this.age>=40){
                             value.s40=1;
                           }else if(fullYear - this.age<60 & fullYear - this.age>=50){
                             value.s50=1;
                           }else{
                             value.s60=1;
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
                           s20:0,
                           s30:0,
                           s40:0,
                           s50:0,
                           s60:0,
                           sUnk:0
                           };
                     for (var idx = 0; idx < countObjVals.length; idx++) {
                         reducedVal.total  += countObjVals[idx].total ;
                         reducedVal.F  += countObjVals[idx].F ;
                         reducedVal.M  += countObjVals[idx].M ;
                         reducedVal.U  += countObjVals[idx].U ;
                         
                         reducedVal.s20  += countObjVals[idx].s20 ;
                         reducedVal.s30  += countObjVals[idx].s30 ;
                         reducedVal.s40  += countObjVals[idx].s40 ;
                         reducedVal.s50  += countObjVals[idx].s50 ;
                         reducedVal.s60  += countObjVals[idx].s60 ;
                         reducedVal.sUnk  += countObjVals[idx].sUnk ;
                          
                     };

                     return reducedVal;
                  };             
                  
       db['search_log_2018-04-03'].mapReduce( mapFunction2,
                     reduceFunction2,
                     {
                      
                       out: { merge: "search_log_reduce_tot_2018-04-03_temp" }
                       
                       
                     }
                   )     
                   
                   
                   
 
      
                    

                   
      