//
//  SecondViewController.swift
//  pal2_Example
//
//  Created by Dimitri Dessus on 15/11/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import pal2

class SecondViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    PalPlugin.sharedInstance.logCurrentScreen(controller: self, route: "/second")
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}
