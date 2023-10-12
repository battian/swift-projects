//
//  ImageViewController.swift
//  P02-ImagesViewer
//
//  Created by Ana Battistini on 11/10/23.
//

import UIKit

class ImageViewController: UIViewController {
  
  @IBOutlet var imageView: UIImageView!
  
  var image: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let image = image {
      imageView.image  = UIImage(named: image)
    }
  }
}
