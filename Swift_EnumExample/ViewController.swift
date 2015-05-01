//
//  ViewController.swift
//  Swift_EnumExample
//
// enum example based on Code from Wes Filleman
//

import UIKit

// Two versions of enumerations
// Version 1: direct method
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
var fruitName_V1: stringEnumType = .Apple


var myFruitName_V2: intEnumType = intEnumType (rawValue: 1)! //Pear
var cannotUseImplicitType = 1  //this is an int and wont work with intEnumType



class ViewController: UIViewController {
    @IBOutlet weak var myImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
      
        let fruitImageView =      UIImageView(image:UIImage(named:"strawberry.png"))
        fruitImageView.frame = CGRect(x: 0, y:0, width:100, height:100)
        view.addSubview(fruitImageView)

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
// ?how do I clear previous image?
        //fruitImageView.removeFromSuperview();  //runtime crash Bad instruction
        //view.clearsContextBeforeDrawing
        fruitImageView = UIImageView(image:UIImage(named: fruitOption.rawValue))
        view.addSubview(fruitImageView)

    }
    
    
    // Version 2: Switch Statement Method
    //                   similar to "C" syntax
    // Case Switch example if the intEnumType was defined as an INT enum.
    
    func fruitSelectedSwitchMethod_v2(fruitOption: intEnumType) {
        
        var fruitName_V2: String = ""
        
        switch fruitOption {
        case let type where fruitOption == intEnumType.Apple:
            fruitName_V2 = "apple.jpg"
        case let type where fruitOption == intEnumType.Pear:
            fruitName_V2 = "pear.jpg"
        case let type where fruitOption == intEnumType.Strawberry:
            fruitName_V2 = "strawberry.png"
        case let type where fruitOption == intEnumType.Lemon:
            fruitName_V2 = "lemon.png"
        default:
            fruitName_V2 = ""
        }
        
        if count(fruitName_V2) > 0 {
            fruitImageView = UIImageView(image:UIImage(named:fruitName_V2))
            view.addSubview(fruitImageView)
        }
    }  // end fruitSelectedSwitchMethod
    
 

}

