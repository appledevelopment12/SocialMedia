import UIKit
import GooglePlaces

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func btn(_ sender:UIButton){
        LocationManager.shared.showAutocomplete(on: self) { lat, long, location in
                    print("Latitude: \(lat), Longitude: \(long), Location: \(location ?? "No name")")
                } 
    }
    @IBAction func btn1(_ sender:UIButton){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "firstVC") as! firstVC
        self.present(vc, animated: true, completion: nil)
    }
}
