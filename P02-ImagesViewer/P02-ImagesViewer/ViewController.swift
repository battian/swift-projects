//
//  ViewController.swift
//  P02-ImagesViewer
//
//  Created by Ana Battistini on 11/10/23.
//

import UIKit

class ViewController: UITableViewController {
  
  var images = [String]()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    createImagesArray()
  }
  
  func createImagesArray() {
    let fm = FileManager.default
    let path = Bundle.main.resourcePath!
    let items = try! fm.contentsOfDirectory(atPath: path)
    
    for item in items {
      if item.contains("jpg") {
        images.append(item)
      }
    }
  }
}

extension ViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return images.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath)
    let parsed = images[indexPath.row].replacingOccurrences(of: ".jpg", with: "")
    cell.textLabel?.text = parsed
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let vc = storyboard?.instantiateViewController(withIdentifier: "Image") as? ImageViewController {
      vc.image = images[indexPath.row]
      navigationController?.pushViewController(vc, animated: true)
    }
  }
}
