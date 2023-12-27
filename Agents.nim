import std/random
import tables
randomize()

type
  CustomRange = object
    low: int
    high: int

let namesM = [
  "Arnold",
  "Boris",
  "Cyril",
  "Daniel",
  "Evzen",
  "Filip",
  "Gustav",
  "Hugo",
  "Ivan",
  "Jan",
  "Karol",
  "Lukas",
  "Matus",
  "Norbert",
  ]

let namesF = [
  "Anna",
  "Beata",
  "Cecilia",
  "Dana",
  "Eva",
  "Hana",
  "Iveta",
  "Jana",
  "Klara",
  "Lenka",
  "Martina",
  ]

let professions =[
  "rybar",
  "polnohospodar",
  "tesar",
  "drevorubac",
  "robotnik", 
  "ucitel", 
  "predavac"
  ] 
let genders = ["M", "F"]   

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

    let num3 = rand(1)
    let gender = genders[num3]
    #random names
    let num = rand(10)

    #random professions
    let num2 = rand(6)
 
    let height = rand(150 .. 190)
    let weight = rand(40 .. 140)
    let age = rand(15 .. 95)

    if gender == "M":
      result[i].add(namesM[num])
    else:
      result[i].add(namesF[num])
    result[i].add(professions[num2])
    result[i].add($height)      # symbol $ to convert to string
    result[i].add($weight)      # symbol $ to convert to string
    result[i].add($age)         # symbol $ to convert to string
    result[i].add($gender)


proc make_items(i: int):OrderedTable[int, seq[string]]=
  result[i] = @[]
