//
//  Service.swift
//  DoSomeThing
//
//  Created by guntex01 on 7/31/20.
//  Copyright © 2020 guntex01. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
class Service {
    static func signUpUser(email: String, password: String, name: String, onSuccess: @escaping () -> Void, onError: @escaping (_ _error: Error?) -> Void){
            let auth = Auth.auth()
    
            auth.createUser(withEmail: email, password: password) {  (authResult, error) in
                if error != nil {
                onError(error!)
                    return
                }
             uploadToDatabase(email: email, name: name, onSuccess: onSuccess)
            }
        }
        static func uploadToDatabase(email: String, name: String, onSuccess: @escaping () -> Void) {
            let ref = Database.database().reference()
            let uid = Auth.auth().currentUser?.uid
    
            ref.child("users").child(uid!).setValue(["email": email, "name": name])
            onSuccess()
        }
     
    static func createAlertController(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        return alert
    }
}
