-module(car_dealership).

-export([listPrices/1]).


listPrices(Currency) -> 
    Cars = #{"BMW i8"=>150000, "Lamborghini Huracan"=>500000, "Ferrari f12"=> 700000},

listPrices([], Currency)->
        io:fwrite("Price" ++ integer_to_list(ConvertedPrice) ++ "\n");

listPrices([], Currency)->
    .

round(number) -> null.
