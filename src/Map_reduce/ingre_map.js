 function() {
                       for (var idx in this.ingredients ) {
                           var key = this.ingredients[idx].name;
                           var value = 1;
                           emit(key, value);
                       };
                    }; 