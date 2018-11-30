//
//  LoginViewController.swift
//  MakeInstagram
//
//  Created by Alucard on 2018/11/30.
//  Copyright © 2018 Stanford University. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseUI
typealias FIRUser = FirebaseAuth.User

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
    // 1
    guard let authUI = FUIAuth.defaultAuthUI() else {
      return
    }
    // 2
    authUI.delegate = self
    
    // 3
    let authViewController = authUI.authViewController()
    present(authViewController, animated: true)
  }
}

extension LoginViewController: FUIAuthDelegate {
  func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
    if let error = error {
      assertionFailure("Error signing in: \(error.localizedDescription)")
      return
    }
    
    print("handle user signup / login")
  }
}
