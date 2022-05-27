//
//  DatabaseManager.swift
//  Instagram
//
//  Created by Moustafa Anas on 19/05/2022.
//

import FirebaseDatabase

public class DatabaseManager {
    
    static let shared = DatabaseManager()
    private let database = Database.database().reference()
    
    // MARK: - Public
    
    /// Check if username and email is Avilable
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void){
        completion(true)
    }
    
    /// Insert new user data to Database
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        database.child(email.safeDatabaseKey()).setValue(["username": username]) { error, _ in
            if error == nil {
                // succeeded
                completion(true)
                return
            } else {
                // failed
                completion(false)
                return
            }
        }
    }
    
 
}
