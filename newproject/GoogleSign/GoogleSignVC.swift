//
//  GoogleSignVC.swift
//  newproject
//
//  Created by Rohit on 09/09/24.
//

import UIKit
import GoogleSignIn
import FirebaseAuth
import Firebase

    class GoogleSignVC: UIViewController {

        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Set the presenting view controller
       GIDSignIn.sharedInstance.configuration = GIDConfiguration(clientID: FirebaseApp.app()?.options.clientID ?? "")
        }
        
        // Trigger the Google Sign-In flow when a button is tapped
        @IBAction func googleSignInTapped(_ sender: Any) {
            print("first")
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }
                   print("second")
                   // Initialize the sign-in configuration with the client ID
                   let config = GIDConfiguration(clientID: clientID)

                   // Start the Google Sign-In flow
                   GIDSignIn.sharedInstance.signIn(withPresenting: self) { user, error in
                       if let error = error {
                           print("Error during Google Sign-In: \(error)")
                           return
                       }
                       
                       guard let user = user else { return }
                       
                       // Retrieve the user's profile details
                       let email = user.user.profile?.email ?? "No Email"
                       let firstName = user.user.profile?.givenName ?? "No First Name"
                       let lastName = user.user.profile?.familyName ?? "No Last Name"
                       let profileURL = user.user.profile?.imageURL(withDimension: 200)?.absoluteString ?? "No Profile URL"
                       
                       print("Email: \(email)")
                       print("First Name: \(firstName)")
                       print("Last Name: \(lastName)")
                       print("Profile URL: \(profileURL)")
                       
                       // Now sign in to Firebase using the Google credentials
                       guard let idToken = user.user.idToken else { return }
                       
                       let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: user.user.accessToken.tokenString)

                       // Sign in to Firebase with Google credentials
                       Auth.auth().signIn(with: credential) { authResult, error in
                           if let error = error {
                               print("Firebase sign-in error: \(error)")
                           } else {
                               print("User signed in with Firebase")
                           }
                       }
                   }
               }
           }
