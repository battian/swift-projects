//
//  DetailViewController.swift
//  P06-ArtInstitute
//
//  Created by Ana Battistini on 30/10/23.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
  var webView: WKWebView!
  var article: Article?
  
  override func loadView() {
    webView = WKWebView()
    view = webView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    guard let article = article else { return }
    let html = """
      <html>
      <head>
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <style> body { font-size: 100%; } </style>
      </head>
      <body>
        <h2>\(article.title)</h2>
        <p>\(article.copy)</p>
      </body>
      </html>
    """
    
    webView.loadHTMLString(html, baseURL: nil)
  }
}
