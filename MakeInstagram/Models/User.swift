//
//  User.swift
//  MakeInstagram
//
//  Created by Alucard on 2018/11/30.
//  Copyright © 2018 Stanford University. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

class User {
  
  // MARK: - Properties
  private static var _current: User?
  static var current: User {
    guard let currentUser = _current else {
      fatalError("Error: current user doesn't exist")
    }
    return currentUser
  }
  static func setCurrent(_ user: User) {
    _current = user
  }

  let uid: String
  let username: String
  
  // MARK: - Init
  
  init(uid: String, username: String) {
    self.uid = uid
    self.username = username
  }
  
  init?(snapshot: DataSnapshot) {
//    guard let dict = snapshot.value as? [String : Any],
//      let username = dict["username"] as? String
//      else { return nil }
//
//    self.uid = snapshot.key
//    self.username = username
    
    guard let dict = snapshot.value as? [String: Any], let username = dict["username"] as? String else { return nil }
    self.uid = snapshot.key
    self.username = username
  }
}
