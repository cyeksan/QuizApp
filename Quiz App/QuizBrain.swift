//
//  QuizBrain.swift
//  Quiz App
//
//  Created by Cansu Aktas on 2023-08-12.
//

import Foundation

struct QuizBrain {
    private var questionIndex = 0
    private var score = 0
    private let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
               Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
               Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
               Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
               Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
               Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
               Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
               Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
               Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
               Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
        
    ]
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        let isAnswerCorrect = userAnswer == quiz[questionIndex].correctAnswer ? true : false
        setScore(isAnswerCorrect: isAnswerCorrect)
        return isAnswerCorrect
    }
    
    func getProgress() -> Float {
        return Float(questionIndex + 1) / Float(quiz.count)
    }
    
    func getQuiz() -> Array<Question> {
        return quiz
    }
    
    func getQuestionText() -> String {
        return quiz[questionIndex].q
    }
    
    func getQuestionOptions() -> Array<String> {
        return quiz[questionIndex].a
    }
    
    private mutating func setScore(isAnswerCorrect: Bool) {
        score = isAnswerCorrect ? score + 1 : score
    }
    
    mutating func getScore() -> Int {
        return score
    }
    
    func getQuestionIndex() -> Int {
        return questionIndex
    }
    
    mutating func moveToNextQuestion() {
        questionIndex += 1
        if(questionIndex >= quiz.count) {
            resetGame()
        }
    }
    private mutating func resetGame() {
        questionIndex = 0
        score = 0
    }
}
