include agents

var population_list = make_population(10)
var item_list = make_items(population_list)

for a,d in population_list:
  echo d

let days = 10

for i in 0 .. days:
    echo "Day " & $i
