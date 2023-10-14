//
//  ViewController.swift
//  P03-FlagQuiz
//
//  Created by Ana Battistini on 13/10/23.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var flag: UIImageView!
  @IBOutlet weak var option1: UIButton!
  @IBOutlet weak var option2: UIButton!
  @IBOutlet weak var option3: UIButton!
  @IBOutlet weak var scoreText: UIBarButtonItem!
  
  var correctAnswer = String()
  var score = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    createQuestion()
  }
  
  func restartGame(action: UIAlertAction! = nil) {
    score = 0
    scoreText.title = "Score: 0"
    createQuestion()
  }
  
  func createQuestion(action: UIAlertAction! = nil) {
    let randomAnswer = countries.randomElement()!.key
    correctAnswer = countries[randomAnswer]!
    
    flag.image = UIImage(named: randomAnswer.lowercased())
    sortButtonsOptions()
  }
  
  func sortButtonsOptions() {
    var btnArray = [option1, option2, option3]
    btnArray.shuffle()
    
    btnArray[0]!.setTitle(correctAnswer, for: .normal)
    btnArray[1]!.setTitle(countries.randomElement()!.value, for: .normal)
    btnArray[2]!.setTitle(countries.randomElement()!.value, for: .normal)
  }
  
  func callAlert(_ title: String) {
    if score == 10 {
      let ac = UIAlertController(title: "You win", message: "Your score is \(score).", preferredStyle: .alert)
      ac.addAction(UIAlertAction(title: "Start over", style: .default, handler: restartGame))
      present(ac, animated: true)
    } else {
      let ac = UIAlertController(title: title, message: "The answer is \(correctAnswer).", preferredStyle: .alert)
      ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: createQuestion))
      present(ac, animated: true)
    }
  }
  
  @IBAction func buttonTapped(_ sender: UIButton) {
    var title: String
    
    if sender.currentTitle! == correctAnswer {
      title = "Correct"
      score += 1
    } else {
      title = "Wrong"
      score = score == 0 ? 0 : score - 1
    }
    
    scoreText.title = "Score: \(score)"
    callAlert(title)
  }
  
}

