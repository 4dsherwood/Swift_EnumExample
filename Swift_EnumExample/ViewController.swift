//
//  ViewController.swift
//  Swift_EnumExample
//
//  Created by Diana_Sherwood on 4/28/15.
//  Copyright (c) 2015 5000Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        let imageVersion1 =      UIImageView(image:UIImage(named:"strawberry.png"))
        imageVersion1.frame = CGRect(x: 0, y:0, width:100, height:200)
        view.addSubview(imageVersion1)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

