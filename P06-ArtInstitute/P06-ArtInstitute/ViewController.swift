//
//  ViewController.swift
//  P06-ArtInstitute
//
//  Created by Ana Battistini on 28/10/23.
//

import UIKit

class ViewController: UITableViewController {
  
  var articles = [Article]()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    getData()
    print(articles)
  }
}

extension ViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return articles.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    let article = articles[indexPath.row]
    cell.textLabel?.text = article.title
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = DetailViewController()
    vc.article = articles[indexPath.row]
    navigationController?.pushViewController(vc, animated: true)
  }
}

extension ViewController {
  func showError() {
    let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
    ac.addAction(UIAlertAction(title: "OK", style: .default))
    present(ac, animated: true)
  }
  
  func parse(_ data: Data) {
    let decoder = JSONDecoder()
    
    if let response = try? decoder.decode(Articles.self, from: data) {
      articles = response.data
      tableView.reloadData()
    }
  }
  
  func getData() {
    let urlString: String
    
    if navigationController?.tabBarItem.tag == 0 {
      urlString = "https://api.artic.edu/api/v1/articles?page=1&limit=30"
    } else {
      urlString = "https://api.artic.edu/api/v1/articles?page=2&limit=30"
    }
    
    if let url = URL(string: urlString) {
      if let data = try? Data(contentsOf: url) {
        parse(data)
        return
      }
    }
    
    showError()
  }
}
