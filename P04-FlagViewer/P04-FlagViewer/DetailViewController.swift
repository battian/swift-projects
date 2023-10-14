//
//  DetailViewController.swift
//  P04-FlagViewer
//
//  Created by Ana Battistini on 14/10/23.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet var imageView: UIImageView!
  
  var flag: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    
    if let flag = flag {
      imageView.image  = UIImage(named: flag)
    }
  }
  
  @objc func shareTapped() {
    guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
      print("No image found")
      return
    }
    
    let title = flag!.replacingOccurrences(of: "@2x.png", with: "").capitalized
    
    let vc = UIActivityViewController(activityItems: [image, title], applicationActivities: [])
    vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
    present(vc, animated: true)
  }
}
