//
//  AuthenticationManager.swift
//  Instagram
//
//  Created by Moustafa Anas on 19/05/2022.
//

import FirebaseAuth

public class AuthManager {
    
    static let shared = AuthManager()
    
    // MARK: - Public
    public func registerNewUser(userName: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        DatabaseManager.shared.canCreateNewUser(with: email, username: userName) { canCreate in
            if canCreate {
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    guard error == nil, result != nil else {
                        // firebase auth could not create acount
                        completion(false)
                        return
                    }
                    
                    // insert into database
                    DatabaseManager.shared.insertNewUser(with: email, username: userName) { inserted in
                        if inserted {
                            completion(true)
                            return
                        } else {
                            // failed to insert to database
                            completion(false)
                            return
                        }
                    }
                }
            } else {
                // either email or username does not exist
                completion(false)
            }
        }
    }
    
    public func loginUser(userName: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        if let email = email {
            // email Login
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                completion(true)
            }
        }
        else if let userName = userName {
            // username login
            print(userName)
        }
    }
    
    /// Attempt to log out firebase user
    public func logOut(completion: (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(true)
            return
        } catch {
            print(error)
            completion(false)
            return
        }
    }
}
