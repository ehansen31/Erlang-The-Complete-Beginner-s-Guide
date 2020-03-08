-module(car_dealership).

-export([listPrices/1]).

listPrices(Currency) ->
    Cars = ["BMW i8", "Lamborghini Huracan", "Ferrari f12"],
    listPrices(Cars, Currency).

listPrices([Car | Rest], Currency) ->
    CarPrices = #{"BMW i8" => 150000,
		  "Lamborghini Huracan" => 500000,
		  "Ferrari f12" => 700000},
    case Currency of
      eur ->
	  ConvertedPrice = round(maps:get(Car, CarPrices) *
				   8.9e-1);
      gdp ->
	  ConvertedPrice = round(maps:get(Car, CarPrices) *
				   7.7e-1);
      usd -> ConvertedPrice = maps:get(Car, CarPrices)
    end,
    io:fwrite("Price " ++
		integer_to_list(ConvertedPrice) ++ "\n"),
    listPrices(Rest, Currency);
listPrices([], _Currency) -> ok.
