//
//  LoginViewController.swift
//  MakeInstagram
//
//  Created by Alucard on 2018/11/30.
//  Copyright © 2018 Stanford University. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  
  // MARK: Properties

  @IBOutlet weak var loginButton: UIButton!
  
  // MARK: VC Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated
  }
  

  // MARK:  - IBActions

  @IBAction func loginButtonTapped(_ sender: Any) {
    print("Login tappted")
  }
}
