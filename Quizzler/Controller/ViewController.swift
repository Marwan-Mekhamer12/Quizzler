//
//  ViewController.swift
//  Quizzler
//
//  Created by Marwan Mekhamer on 18/03/2025.
//

import UIKit

class ViewController: UIViewController {
    
    var marwan = QuizBrain()

    @IBOutlet weak var Scorelbl: UILabel!
    @IBOutlet weak var Quizlbl: UILabel!
    @IBOutlet weak var choice1btn: UIButton!
    @IBOutlet weak var choice2btn: UIButton!
    @IBOutlet weak var choice3btn: UIButton!
    @IBOutlet weak var progressSS: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateData()
    }
    
    @IBAction func btnButtons(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle ?? ""
        let userDoIt = marwan.getCorrectAnswer(userAnswer)
        progressSS.progress = 0
        
        if userDoIt {
            sender.backgroundColor = .green
            marwan.getAudio("Select")
        }else {
            sender.backgroundColor = .red
            marwan.getAudio("Select")
        }
        
        marwan.nextQuiz()
        progressSS.progress = marwan.getProgress()

        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateData), userInfo: nil, repeats: false)
    }
    
    @objc func updateData() {
        Scorelbl.text = String(marwan.score)
        Quizlbl.text = marwan.getQuiz()
        choice1btn.setTitle(marwan.getchoice1(), for: .normal)
        choice2btn.setTitle(marwan.getchoice2(), for: .normal)
        choice3btn.setTitle(marwan.getchoice3(), for: .normal)
        choice1btn.backgroundColor = .clear
        choice2btn.backgroundColor = .clear
        choice3btn.backgroundColor = .clear
        Scorelbl.text = "Your Score: \(marwan.score)"


    }
    
  

}
