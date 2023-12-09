import std/random
randomize()

type
  CustomRange = object
    low: int
    high: int

type
  Agent = tuple
    name: string
    profession: string

type
  Datalist = array[3, string]

let names: Datalist = ["Arnold", "Matus", "Boris"]
let professions: Datalist = ["robotnik", "ucitel", "predavac"]    

iterator items(range: CustomRange): int =
  var i = range.low
  while i <= range.high:
    yield i
    inc i

iterator pairs(range: CustomRange): tuple[a: int, b: char] =
  for i in range:  # uses CustomRange.items
    yield (i, char(i + ord('a')))

proc make_population(n: int) =
  for i, c in CustomRange(low: 1, high: n):
    # Pick a number in 0..2.
    let num = rand(2)
    doAssert num in 0..2
    echo names[num]

    let num2 = rand(2)
    doAssert num2 in 0..2
    echo professions[num2]  

make_population(10)
