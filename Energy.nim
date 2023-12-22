#average Human 1800 kCal per day
#Mifflin-ST Jeor Equation

proc calc_mifflin(
    weight: float64, 
    height:float64, 
    age: int, 
    gender: char,
    activity: string): int =

#Activity factor
#low = 1.2
#medium = 1.5
#high = 1.95

#Mifflin-St Jeor calculation for man
    #C0nvert actfactor
    var actfactor = 1.0
    if activity == "low":
        actfactor = 1.2
    if activity == "medium":
        actfactor = 1.5
    if activity == "high":
        actfactor = 1.95

    if gender == 'M':
       echo gender
       var bmr = ( 10*weight + 6.25*height - 5*age.float + 5 ) * actfactor.float
       return bmr.int
    #Calculation fo woman and unknown      
    else:
       var bmr = ( 10*weight + 6.25*height - 5*age.float - 161 ) * actfactor.float
       return bmr.int          
    
var energy = calc_mifflin(76, 177, 35, 'M', "high")
echo energy
