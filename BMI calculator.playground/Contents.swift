import UIKit

func bmiCalculator(weightInPounds : Double, heightInFeet : Double) -> String {
    let massInKg =  weightInPounds * 0.453592
    let heightInMeters = heightInFeet * 0.3048
    let bmi = massInKg / (heightInMeters * heightInMeters)
    
    print("Your BMI is \(bmi)")
    var interpretation = " "
    
    if bmi > 25{
        interpretation = ("You are overweight")
    }
    else if bmi >= 18 && bmi <= 25 {
        interpretation = ("You have a normal weight")
    }
    else if bmi < 18{
        interpretation = ("You are underweight")
    }
    return "Your BMI is \(bmi) and \(interpretation)"
    
}

bmiCalculator(weightInPounds: 120, heightInFeet: 5.5)
