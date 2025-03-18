//
//  QuizBrain.swift
//  Quizzler
//
//  Created by Marwan Mekhamer on 18/03/2025.
//

import Foundation
import AVFoundation


struct QuizBrain {
    let quiz = [
        Quiztions(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Quiztions(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Quiztions(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Quiztions(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Quiztions(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Quiztions(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Quiztions(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Quiztions(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Quiztions(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Quiztions(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
        
        
        
    ]
    
    var QuizNumber = 0
    var score = 0
    var player: AVAudioPlayer!
    
    func getQuiz() -> String{
        return quiz[QuizNumber].text
    }
    
    func getchoice1() -> String {
        return quiz[QuizNumber].answer[0]
    }
    
    func getchoice2() -> String {
        return quiz[QuizNumber].answer[1]
    }
    
    func getchoice3() -> String {
        return quiz[QuizNumber].answer[2]
    }
    
    mutating func nextQuiz() {
        if QuizNumber + 1 < quiz.count {
            QuizNumber += 1
            
            
        }else {
            QuizNumber = 0
            score = 0
            getAudio("game-level-complete")
            
        }
    }
    
    func getScore() -> Int{
        return score
    }
    
    mutating func getCorrectAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[QuizNumber].correct {
            score += 1
            return true
        }else {
            return false
        }
    }
    
    func getProgress() -> Float{
        return Float(QuizNumber + 1) / Float(quiz.count)
    }
    
    mutating func getAudio(_ song : String) {
        let url = Bundle.main.url(forResource: song, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
