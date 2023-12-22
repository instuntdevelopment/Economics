#average Human 1800 kCal per day
#Mifflin-ST Jeor Equation

proc calc_mifflin(weight: float64, height:float64, age: int, gender: char): int =
#Mifflin-St Jeor calculation for man
    if gender == 'M':
       echo gender
       var bmr = 10*weight + 6.25*height - 5*age.float + 5
       return bmr.int
    #Calculation fo woman and unknown      
    else:
       var bmr = 10*weight + 6.25*height - 5*age.float - 161
       return bmr.int          

var energy = calc_mifflin(76, 177, 35, 'F')
echo energy
