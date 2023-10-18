//
//  ViewController.swift
//  P05-ShoppingList
//
//  Created by Ana Battistini on 18/10/23.
//

import UIKit

class ViewController: UITableViewController {
  
  var shoppingList = [String]()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    setup()
  }

  func setup() {
    title = "Shopping List"
    
    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(newList))
    
    let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
    let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareItems))
    navigationItem.rightBarButtonItems = [shareButton, addButton]
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return shoppingList.count
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)
    cell.textLabel?.text = shoppingList[indexPath.row]
    
    return cell
  }
  
  @objc func newList() {
    shoppingList.removeAll(keepingCapacity: true)
    tableView.reloadData()
  }
  
  @objc func shareItems() {
    let listString = shoppingList.joined(separator: ", ")
    
    let activityVC = UIActivityViewController(
      activityItems: [listString],
      applicationActivities: nil
    )
    
    present(activityVC, animated: true)
  }
  
  @objc func addButtonTapped() {
    let ac = UIAlertController(title: "Add new item", message: nil, preferredStyle: .alert)
    ac.addTextField()
    
    let submitAction = UIAlertAction(title: "Add", style: .default) { [weak self, weak ac] action in
      guard let item = ac?.textFields?[0].text else { return }
      self?.addItem(item)
    }
    
    ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    ac.addAction(submitAction)
    present(ac, animated: true)
  }
  
  func addItem(_ item: String) {
    if !item.isEmpty {
      shoppingList.insert(item, at: 0)
      
      let indexPath = IndexPath(row: 0, section: 0)
      tableView.insertRows(at: [indexPath], with: .automatic)
    } else {
      let ac = UIAlertController(title: "You have to type something!", message: nil, preferredStyle: .alert)
      ac.addAction(UIAlertAction(title: "OK", style: .cancel))
      present(ac, animated: true)
    }
  }
}

