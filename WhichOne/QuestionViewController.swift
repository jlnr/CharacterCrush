//
//  QuestionViewController.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 15.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import UIKit

/// Represents the game state at any given time.
struct GameState {
    
    let correctCount: Int
    let incorrectCount: Int
    let question: Question
    let shuffledAnswers: [Character]
    let remainingQuestions: [Question]
    
    init(questions: [Question], correctCount: Int = 0, incorrectCount: Int = 0) {
        precondition(!questions.isEmpty, "Cannot create a game without questions")

        self.correctCount = correctCount
        self.incorrectCount = incorrectCount

        let nextQuestion = questions.randomElement()!
        
        self.question = nextQuestion
        self.shuffledAnswers = self.question.answers.shuffled()
        self.remainingQuestions = questions.filter { $0 != nextQuestion }
    }
    
    var progress: Int {
        return correctCount + incorrectCount + 1
    }
    
    var totalCount: Int {
        return progress + remainingQuestions.count
    }
    
}

/// This controller implements the question part of the "Which one is it?" game.
class QuestionViewController: UIViewController {
    
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answerButtons: [UIButton]!
    
    // "Which one is it?" only supports Traditional Chinese right now.
    let soundPlayer = SoundPlayer(voiceLanguage: "zh-TW")

    var selectedAnswer: Character?
    var state: GameState!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.state = self.state ?? GameState(questions: allQuestions)

        self.progressLabel.text = "Question \(self.state.progress)/\(self.state.totalCount):"
        self.questionLabel.text = self.state.question.sentence
        
        for button in answerButtons {
            let index = button.tag
            if index >= self.state.shuffledAnswers.count {
                button.isHidden = true
            } else {
                button.isHidden = false
                button.setTitle(String(self.state.shuffledAnswers[index]), for: .normal)
            }
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationController!.viewControllers.removeAll { $0 is AnswerViewController }
    }

    @IBAction func answer(_ sender: UIButton) {
        self.selectedAnswer = self.state.shuffledAnswers[sender.tag]
        
        if selectedAnswer == state.question.correctAnswer {
            soundPlayer.playSuccess()
        } else {
            soundPlayer.playTick()
        }
        
        performSegue(withIdentifier: "answer", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let answerViewController as AnswerViewController:
            answerViewController.state = self.state
            answerViewController.selectedAnswer = self.selectedAnswer
        default:
            super.prepare(for: segue, sender: sender)
        }
    }
    
}
