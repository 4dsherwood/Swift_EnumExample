//
//  ViewController.swift
//  Swift_EnumExample
//
//

import UIKit

// Two versions of enumerations
// Version 1: direct method
enum stringEnumType: String {
    case Apple          = "apple.png"
    case Pear           = "pear.png"
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

var fruitImage: UIImageView!
var fruitName_V1: stringEnumType = .Apple


var myFruitName_V2: intEnumType = intEnumType (rawValue: 0)! //Apple
var cannotUseImplicitType = 1  //this is an int and wont work with intEnumType



class ViewController: UIViewController {
    @IBOutlet weak var myImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
      
        let myImage =      UIImageView(image:UIImage(named:"strawberry.png"))
        myImage.frame = CGRect(x: 0, y:0, width:200, height:200)
        view.addSubview(myImage)

    }

    @IBAction func buttonNextFruit_v1(sender: UIButton) {
        fruitSelectedDirectMethod_v1(fruitName_V1)
    }
    
    @IBAction func buttonNextFruit_v2(sender: UIButton) {
        fruitSelectedSwitchMethod_v2(myFruitName_V2)
    }
    
    // USAGE EXAMPLES
    //
    // Version 1: Direct Method
    //               leverages Swift enumeration
    // Use the .rawValue operator to get to the underlying value (string) from the enum as a value to pass into the UIImage.named call.
    func fruitSelectedDirectMethod_v1(fruitOption: stringEnumType) {
        fruitImage = UIImageView(image:UIImage(named: fruitOption.rawValue))
    }
    
    
    // Version 2: Switch Statement Method
    //                   similar to "C" syntax
    // Case Switch example if the intEnumType was defined as an INT enum.
    
    func fruitSelectedSwitchMethod_v2(fruitOption: intEnumType) {
        
        var fruitName_V2: String = ""
        
        switch fruitOption {
        case let type where fruitOption == intEnumType.Apple:
            fruitName_V2 = "apple.png"
        case let type where fruitOption == intEnumType.Pear:
            fruitName_V2 = "pear.png"
        case let type where fruitOption == intEnumType.Strawberry:
            fruitName_V2 = "strawberry.png"
        case let type where fruitOption == intEnumType.Lemon:
            fruitName_V2 = "lemon.png"
        default:
            fruitName_V2 = ""
        }
        
        if count(fruitName_V2) > 0 {
            fruitImage = UIImageView(image:UIImage(named:fruitName_V2))
        }
    }  // end fruitSelectedSwitchMethod
    
 

}

