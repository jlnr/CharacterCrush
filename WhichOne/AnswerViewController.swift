//
//  AnswerViewController.swift
//  CharacterCrush
//
//  Created by Julian Raschke on 15.10.18.
//  Copyright © 2018 Julian Raschke. All rights reserved.
//

import UIKit

/// This controller implements the solution part of the "Which one is it?" game.
class AnswerViewController: UIViewController {
    
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var incorrectLabel: UILabel!
    
    @IBOutlet var answerStackViews: [UIStackView]!
    @IBOutlet var answerCharacters: [UILabel]!
    @IBOutlet var answerPinyin: [UILabel]!
    @IBOutlet var answerDefinitions: [UILabel]!
    
    var state: GameState!
    var selectedAnswer: Character!
    
    private func colorForAnswer(index: Int) -> UIColor {
        let answer = state.shuffledAnswers[index]
        let correctAnswer = state.question.correctAnswer
        
        if answer == correctAnswer {
            // The correct answer is always green.
            return .brandGreen
        } else if selectedAnswer == answer {
            // If the user picked an incorrect answer, highlight it in red.
            return .brandRed
        } else {
            return .lightGray
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.progressLabel.text = "Answer \(state.progress)/\(state.totalCount):"
        self.answerLabel.text = state.question.sentence.replacingOccurrences(of: "�", with: String(state.question.correctAnswer))

        if state.remainingQuestions.isEmpty {
            let item = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(showFinalScore(_:)))
            self.navigationItem.rightBarButtonItem = item
        }
        
        if selectedAnswer == state.question.correctAnswer {
            self.incorrectLabel.isHidden = true
        } else {
            self.correctLabel.isHidden = true
        }
        
        // Hide superfluous answers.
        for stackView in answerStackViews where stackView.tag >= state.shuffledAnswers.count {
            stackView.isHidden = true
        }
        
        // Present (with the appropriate color) all possible answers.
        for label in answerCharacters where label.tag < state.shuffledAnswers.count {
            label.text = String(state.shuffledAnswers[label.tag])
            label.textColor = colorForAnswer(index: label.tag)
        }
        for label in answerPinyin where label.tag < state.shuffledAnswers.count {
            label.text = hanziDefinitions[state.shuffledAnswers[label.tag]]!.pinyin
            label.textColor = colorForAnswer(index: label.tag)
        }
        for label in answerDefinitions where label.tag < state.shuffledAnswers.count {
            label.text = hanziDefinitions[state.shuffledAnswers[label.tag]]!.translation
            label.textColor = colorForAnswer(index: label.tag)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationController!.viewControllers.removeAll { $0 is QuestionViewController }
    }
    
    @IBAction func showNextQuestion(_ sender: Any) {
        performSegue(withIdentifier: "nextQuestion", sender: sender)
    }
    
    @objc func showFinalScore(_ sender: Any) {
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.navigationController?.popViewController(animated: true)
        }
        
        let isCorrect = (selectedAnswer == state.question.correctAnswer)
        let correctCount = state.correctCount + (isCorrect ? 1 : 0)
        let gameOverMessage = "Score: \(correctCount)/\(state.progress)"
        
        let alertController = UIAlertController(title: "Game Over",
                                                message: gameOverMessage,
                                                preferredStyle: .alert)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let questionViewController as QuestionViewController:
            let isCorrect = (selectedAnswer == state.question.correctAnswer)
            let correctCount = state.correctCount + (isCorrect ? 1 : 0)
            let incorrectCount = state.incorrectCount + (isCorrect ? 0 : 1)
            questionViewController.state = GameState(questions: state.remainingQuestions,
                                                     correctCount: correctCount,
                                                     incorrectCount: incorrectCount)
        default:
            super.prepare(for: segue, sender: sender)
        }
    }
    
}
