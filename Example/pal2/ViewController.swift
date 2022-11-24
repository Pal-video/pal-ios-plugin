//
//  ViewController.swift
//  pal2
//
//  Created by istornz on 11/15/2022.
//  Copyright (c) 2022 istornz. All rights reserved.
//

import UIKit
import pal2

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    PalPlugin.sharedInstance.clearSession {
      
    }
    PalPlugin.sharedInstance.logCurrentScreen(controller: self, route: "/first")
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}

