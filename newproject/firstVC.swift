//
//  firstVC.swift
//  newproject
//
//  Created by Rohit on 07/09/24.
//

import UIKit

class firstVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @IBAction func btn(_ sender:UIButton){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.present(vc, animated: true, completion: nil)
        //self.navigationController?.pushViewController(vc, animated: true)
    }

}
