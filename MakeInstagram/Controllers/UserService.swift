//
//  UserService.swift
//  MakeInstagram
//
//  Created by Alucard on 2018/12/03.
//  Copyright © 2018 Stanford University. All rights reserved.
//

import Foundation
import FirebaseAuth.FIRUser
import FirebaseDatabase

struct UserService {
  static func create(_ firUser: FIRUser, username: String, completion: @escaping (User?) -> Void){
        // get reference of Database
        let ref = Database.database().reference().child("users").child(firUser.uid)
        // set value to database
        ref.setValue(["username": username]) { (error, ref) in
          if let error = error {
            assertionFailure(error.localizedDescription)
            return completion(nil)
          }
          // Listen if set value ok -> get user and do something
          ref.observeSingleEvent(of: .value, with: { (snapshot) in
            let user = User(snapshot: snapshot)
            completion(user)
          })
        }
  }
}
