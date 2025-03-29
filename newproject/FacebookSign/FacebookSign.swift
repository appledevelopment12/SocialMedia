//
//  FacebookSign.swift
//  newproject
//
//  Created by Rohit on 10/09/24.
//
import UIKit
import FacebookLogin
import FacebookCore

class FacebookSign: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func facebookLoginTapped(_ sender: UIButton) {
        let loginManager = LoginManager()
        
        loginManager.logIn(permissions: [.publicProfile, .email], viewController: self) { result in
            switch result {
            case .success(granted: _, declined: _, token: let accessToken):
                self.getFacebookUserProfile(token: accessToken.tokenString)
            case .failed(let error):
                print("Facebook login failed: \(error)")
            case .cancelled:
                print("Facebook login was cancelled")
            }
        }
    }

    func getFacebookUserProfile(token: String) {
        let request = GraphRequest(graphPath: "me", parameters: ["fields": "id, name, email, picture.type(large)"], tokenString: token, version: nil, httpMethod: .get)
        request.start { _, result, error in
            if let error = error {
                print("Error fetching Facebook user data: \(error)")
            } else if let userData = result as? [String: Any] {
                let email = userData["email"] as? String ?? "No Email"
                let name = userData["name"] as? String ?? "No Name"
                if let pictureData = userData["picture"] as? [String: Any],
                   let picture = pictureData["data"] as? [String: Any],
                   let pictureUrl = picture["url"] as? String {
                    print("User Profile: Name: \(name), Email: \(email), Profile Picture: \(pictureUrl)")
                }
            }
        }
    }
}
