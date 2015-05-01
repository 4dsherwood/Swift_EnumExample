//
//  ViewController.swift
//  Swift_EnumExample
//
// Compare "C" style Int enum with Swift's String enum
//
// Version 1: Swift enumString and Direct method to access it
//  One line of code to access the correct string associated with the enum value
//  The number if lines of code to access the string is the same regardless 
//       of the # of enums.
//  Business logic can be collected and maintained in one location with 
//       all the enums/structs.
//
// Version 2: Enum using an Int (which is used in “C”)
//   This approach uses about ~10 lines of code, because you need a switch statement 
//   the number of lines of code INCREASES as the number of enums increases.
//   Business logic is embedded in the switch statement.
// 
// Example created for Starting Out Swiftly by Diana Sherwood
//       enum example based on Code from Wes Filleman
//
//

import UIKit

// Two versions of enumerations
// Version 1: Direct Method
enum stringEnumType: String {
    case Apple          = "apple.jpg"
    case Pear           = "pear.jpg"
    case Strawberry     = "strawberry.png"
    case Lemon          = "lemon.png"
}

//Version 2: Switch Statement Method
enum intEnumType: Int {
    case Apple
    case Pear
    case Strawberry
    case Lemon
}

var fruitImageView: UIImageView!
var fruitName_V1: stringEnumType = .Apple  // type inference of stringEnumType
var explicitName: stringEnumType = stringEnumType.Apple  // explicit


var fruitNameAsInt_V2  = intEnumType.Pear               // type inference
var myExplicitType2    : intEnumType = intEnumType (rawValue: 1)! //explicit

// Swift is strongly typed
var cannotUseSimpleIntType = 1  //this is an Int can't be used where you need intEnumType
    //ERROR: fruitSelectedSwitchMethod_v2(cannotUseSimpleIntType)

class ViewController: UIViewController {
    @IBOutlet weak var myImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
      
        let fruitImageView =      UIImageView(image:UIImage(named:"strawberry.png"))
        fruitImageView.frame = CGRect(x: 0, y:25, width:250, height:250)
        view.addSubview(fruitImageView)

    }

    @IBAction func buttonNextFruit_v1(sender: UIButton) {
        fruitSelectedDirectMethod_v1(fruitName_V1)
    }
    
    @IBAction func buttonNextFruit_v2(sender: UIButton) {
        fruitSelectedSwitchMethod_v2(fruitNameAsInt_V2)
    }
    
    // USAGE EXAMPLES
    //
    // Version 1: Direct Method
    //               leverages Swift enumeration
    // Use the .rawValue operator to get to the underlying value (string) from the enum as a value to pass into the UIImage.named call.
    func fruitSelectedDirectMethod_v1(fruitOption: stringEnumType) {
        
        fruitImageView = UIImageView(image:UIImage(named: fruitOption.rawValue))
        fruitImageView.frame = CGRect(x: 0, y:25, width:250, height:250)
        view.addSubview(fruitImageView)

    }
        
    // Version 2: Switch Statement Method
    //                   similar to "C" syntax
    // Case Switch example if the intEnumType was defined as an INT enum.
    
    func fruitSelectedSwitchMethod_v2(fruitOption: intEnumType) {
        
        var fruitName_V2: String = ""
        
        switch fruitOption {
//explicit (long hand form of case statement)
        case let type where fruitOption == intEnumType.Apple:
            fruitName_V2 = "apple.jpg"
            
// using Type Inference decreases the code you need to type
        case .Pear:
            fruitName_V2 = "pear.jpg"
        case .Strawberry:
            fruitName_V2 = "strawberry.png"
        case .Lemon:
            fruitName_V2 = "lemon.png"
        default:
            fruitName_V2 = ""
        }
        
        if count(fruitName_V2) > 0 {
            fruitImageView = UIImageView(image:UIImage(named:fruitName_V2))
            fruitImageView.frame = CGRect(x: 0, y:25, width:250, height:250)
            view.addSubview(fruitImageView)
        }
    }  // end fruitSelectedSwitchMethod
    
 

}

