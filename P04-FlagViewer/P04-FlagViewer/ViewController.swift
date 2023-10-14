//
//  ViewController.swift
//  P04-FlagViewer
//
//  Created by Ana Battistini on 14/10/23.
//

import UIKit

class ViewController: UITableViewController {
  
  var flags = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let fm = FileManager.default
    let path = Bundle.main.resourcePath!
    let items = try! fm.contentsOfDirectory(atPath: path)
    
    for item in items {
      if item.hasSuffix("@2x.png") {
        flags.append(item)
      }
    }
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return flags.count
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    cell.textLabel?.text = flags[indexPath.row].replacingOccurrences(of: "@2x.png", with: "").capitalized
    
    cell.imageView?.image = UIImage(named: flags[indexPath.row])
    cell.imageView?.layer.borderWidth = 1
    cell.imageView?.layer.borderColor = UIColor.lightGray.cgColor
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
      vc.flag = flags[indexPath.row]
      navigationController?.pushViewController(vc, animated: true)
      
      vc.title = flags[indexPath.row].replacingOccurrences(of: "@2x.png", with: "").capitalized
    }
  }
  
}

