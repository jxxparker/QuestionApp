import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! //True or False
        let userGotItRight = quizBrain.checkAnswer(userAnswer) //capturing the answer user put aka(true or false)
        
        if userGotItRight { //if they got it right
            sender.backgroundColor = UIColor.green //change the color to green if its right
        } else { //if its wrong
            sender.backgroundColor = UIColor.red //changing the color to red if its wrong
        }
        
        quizBrain.nextQuestion() //struct  from quizBrain from models
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() { //func that shows which question is showing
        questionLabel.text = quizBrain.getQuestionText() //look quizbrain
        progressBar.progress = quizBrain.getProgress() //from quizbrain
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
    }
}

