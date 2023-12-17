import std/random
import tables
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
  Namelist = array[3, string]
  Professionlist = array[3, string]

let names: Namelist = ["Arnold", "Matus", "Boris"]
let professions: Professionlist = ["robotnik", "ucitel", "predavac"]    

iterator items(range: CustomRange): int =
  var i = range.low
  while i <= range.high:
    yield i
    inc i

iterator pairs(range: CustomRange): tuple[a: int, b: char] =
  for i in range:  # uses CustomRange.items
    yield (i, char(i + ord('a')))

proc make_population(n: int):OrderedTable[int, seq[string]]=
  result = initOrderedTable[int, seq[string]]()
  for i, c in CustomRange(low: 1, high: n):
    result[i] = @[]
    # Pick a number in 0..2.
    let num = rand(2)
    doAssert num in 0..2
    let num2 = rand(2)
    doAssert num2 in 0..2 

    result[i].add(names[num])
    result[i].add(professions[num2])

var population_list = make_population(10)
echo population_list
