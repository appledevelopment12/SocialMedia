//
//  CountryCodeVC.swift
//  newproject
//
//  Created by Rohit on 09/09/24.
//

import UIKit
import CountryPickerView

class CountryCodeVC: UIViewController,CountryPickerViewDelegate,CountryPickerViewDataSource {
    
    let countryPickerView = CountryPickerView()
    @IBOutlet weak var commentTextView: UITextView!
    
    @IBOutlet weak var img:UIImageView!
    @IBOutlet weak var countryCodeLbl:UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.commentTextView.layer.cornerRadius = 10
        self.commentTextView.layer.borderColor = UIColor.gray.cgColor
        self.commentTextView.layer.borderWidth = 1
        self.commentTextView.delegate = self
        self.commentTextView.text = "Type message here..."
        self.commentTextView.textColor = UIColor.lightGray
        
        
        
        countryPickerView.delegate = self
        countryPickerView.dataSource = self
    }
    
    @IBAction func countryAction(_ sender: UIButton) {
        countryPickerView.showCountriesList(from: self)
    }
    func countryPickerView(_ countryPickerView: CountryPickerView, didSelectCountry country: Country) {
        self.countryCodeLbl.text! = country.phoneCode
        self.img.image = country.flag
        
        
    }
}
extension CountryCodeVC: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if self.commentTextView.textColor == UIColor.lightGray {
            self.commentTextView.text = nil
            self.commentTextView.textColor = UIColor.black
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if self.commentTextView.text! == "Type message here..." || self.commentTextView.text! == "" {
//            self.commentTextView.text = "Type message"
        }
        else {
        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if self.commentTextView.text.isEmpty {
            self.commentTextView.text = "Type message here..."
            self.commentTextView.textColor = UIColor.lightGray
        }
    }

}
