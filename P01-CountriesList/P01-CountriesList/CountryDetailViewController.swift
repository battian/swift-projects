//
//  CountryDetailViewController.swift
//  P01-CountriesList
//
//  Created by battian on 05/10/23.
//

import UIKit

class CountryDetailViewController: UIViewController {
  
  var country: Country?
  
  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var code: UILabel!
  @IBOutlet weak var timezone: UILabel!
  @IBOutlet weak var utc: UILabel!
  @IBOutlet weak var callingCode: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.title = country?.name ?? ""
    
    
    code.text = country?.code ?? ""
    timezone.text = country?.timezone ?? ""
    utc.text = country?.utc ?? ""
    callingCode.text = country?.mobileCode ?? ""
  }

}
