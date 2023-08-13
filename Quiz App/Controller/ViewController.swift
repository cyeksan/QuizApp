//
//  ViewController.swift
//  Quiz App
//
//  Created by Cansu Aktas on 2023-08-11.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        progressView.progress = 0

        [option1Button, option2Button, option3Button].forEach { button in
            button?.layer.borderColor = UIColor(named: "ButtonAccent")?.cgColor
        }
        
        updateQuestionUI()
    }
    
    func updateQuestionUI() {
        let questionOptions = quizBrain.getQuestionOptions()
        [option1Button, option2Button, option3Button].enumerated().forEach { index, button in
            button?.setTitle(questionOptions[index], for: .normal)
            button?.backgroundColor = .clear
            button?.isEnabled = true
        }
        
        questionLabel.text = quizBrain.getQuestionText()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        guard let userAnswer = sender.titleLabel?.text else { return }
        
        let isAnswerCorrect = quizBrain.checkAnswer(userAnswer: userAnswer)
        let backgroundColor: UIColor = isAnswerCorrect ? .green : .red
        
        sender.backgroundColor = backgroundColor
        sender.isEnabled = false
        
        print("Score: \(quizBrain.getScore())")
        
        progressView.progress = quizBrain.getProgress()
        
        updateUI(after: 1, sender: sender)
    }
    
    func updateUI(after delay: TimeInterval, sender: UIButton) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.quizBrain.moveToNextQuestion()
            
            if self.quizBrain.getQuestionIndex() == 0 {
                self.progressView.progress = 0
            }
            
            self.updateQuestionUI()
        }
    }
}
