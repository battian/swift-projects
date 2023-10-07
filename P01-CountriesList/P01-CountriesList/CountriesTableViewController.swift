//
//  CountriesTableViewController.swift
//  P01-CountriesList
//
//  Created by battian on 05/10/23.
//

import UIKit

class CountriesTableViewController: UIViewController {
  
  var countries: Response?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    paseJSON()
  }
  
  private func paseJSON() {
    guard let path = Bundle.main.path(forResource: "data", ofType: "json") else {
      return
    }
    
    let url = URL(fileURLWithPath: path)
    
    
    do {
      let jsonData = try Data(contentsOf: url)
      countries = try JSONDecoder().decode(Response.self, from: jsonData)
    } catch {
      print(error)
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let destinationVC = segue.destination as! CountryDetailViewController
    destinationVC.country = sender as? Country
  }
}

extension CountriesTableViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let countries = countries {
      return countries.data.count
    }
    
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell") else {
      return UITableViewCell()
    }
    
    cell.textLabel?.text = countries?.data[indexPath.row].name
    
    return cell
    
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let country = countries?.data[indexPath.row]
    
    performSegue(withIdentifier: "toCountryDetailVC", sender: country)
  }
}
