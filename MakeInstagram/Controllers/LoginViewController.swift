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
import FirebaseDatabase

typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController {
  
  // MARK: Properties
  @IBOutlet weak var loginButton: UIButton!
  
  // MARK: VC Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  // MARK:  - IBActions
  @IBAction func loginButtonTapped(_ sender: Any) {
    guard let authUI = FUIAuth.defaultAuthUI() else { return }
    authUI.delegate = self

    let authViewController = authUI.authViewController()
    present(authViewController, animated: true)
    presentedViewController
  }
}

extension LoginViewController: FUIAuthDelegate {
  // authDataResult: Data result from firebase
  // error: error
  // Firebase AuthUI reference -> Main object to communicate
  func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
    if let error = error {
      assertionFailure("Error signing in: \(error.localizedDescription)")
      return
    }
    guard let user = authDataResult?.user else { return }
    let userRef = Database.database().reference().child("users").child(user.uid)

    userRef.observeSingleEvent(of: .value, with: { [unowned self] (snapshot) in
      if let user = User(snapshot: snapshot) {
        User.setCurrent(user)
  
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        if let initialViewController = storyboard.instantiateInitialViewController() {
          self.view.window?.rootViewController = initialViewController
          self.view.window?.makeKeyAndVisible()
        }
      } else {
        self.performSegue(withIdentifier: "toCreateUsername", sender: self)
      }
    })
  }
}
