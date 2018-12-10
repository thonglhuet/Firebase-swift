//
//  CreateUsernameViewController.swift
//  MakeInstagram
//
//  Created by Alucard on 2018/12/02.
//  Copyright © 2018 Stanford University. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateUsernameViewController: UIViewController {
  @IBAction func nextButtonTapped(_ sender: UIButton) {
    // Check if currentUser available, TextField is filled
    guard let firUser = Auth.auth().currentUser,
      let username = usernameTextField.text,
      !username.isEmpty else { return }
//    // get reference of Database
//    let ref = Database.database().reference().child("users").child(firUser.uid)
//    // set value to database
//    ref.setValue(["username": username]) { (error, ref) in
//      if let error = error {
//        assertionFailure(error.localizedDescription)
//        return
//      }
//      // Listen if set value ok -> get user ane do something
//      ref.observeSingleEvent(of: .value, with: { (snapshot) in
//        let user = User(snapshot: snapshot)
//      })
    
    UserService.create(firUser, username: username) { (user) in
      guard let user = user else { return }
      User.setCurrent(user)
      let storyboard = UIStoryboard(name: "Main", bundle: .main)
      if let initialViewController = storyboard.instantiateInitialViewController() {
        self.view.window?.rootViewController = initialViewController
        self.view.window?.makeKeyAndVisible()
      }
    }
  }
  @IBOutlet var usernameTextField: UITextField!
}
