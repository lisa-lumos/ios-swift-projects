# 5. Quizzler App

## Getting Started
Create IBOutlet for questionLabel, progressBar, trueButton and falseButton. Create IBAction for True and False button named as answerButtonClicked, and Type as UIButton. 

2D array in Swift:
```
let quiz = [
    ["Q1", "True"],
    ["Q2", "False"],
    ["Q3", "True"]
]
print(quiz[0][0])
```

## Structures in Swift
Structures allow us to create `custom data types`, that could group up related `properties` and `behaviours (methods)`. The first letter of a struct should be capitalized to indicate as a datatype. (It feels similar to a class in Java...) 
```
sturct Town {
    let name: String
    var citizens: [String]
    var resources: [String: Int]
    
    // Initializer for the struct 
    init(name: String, citizens: [String], resources: [String: Int]) {
        self.name = name
        self.citizens = citizens
        self.resources = resources
    }
    
    func fortify() {
        print("Defences increased!")
    }
}

var myTown = Town(name: "lisaTown", citizens: ["Lisa", "eggMuffin"], resources: ["Coconuts": 100])

var ghostTown = Town(name: "Ghost Town", citizens: [], resources: ["grass": 1])

myTown.citizens.append("chicken")
ghostTown.fortify()
```

## Creating a Question Struct
Create a new Swift file by `File` -> `New` -> `File...`, in the new window, choose `Swift File`, and name it "Question". Or, in the left pane, right click on the folder you want the file to be in, and click `New File...`. It is a convention that the file name is same with the structure name. 
```
struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
```

Then in "ViewController.swift" file:
```
let quiz = [
        Question(q: "Q1", a: "True"),
        Question(q: "Q2", a: "False"),
        Question(q: "Q3", a: "True")
    ]
```

(If get "Cannot find struct in scope" error, restart xCode. )

## The MVC Design Pattern
`Model View Controller (MVC)` means we split the project into 3 main components: the model (data and logic), the view (UI), and the controller (Mediator). So the View and the Model never talk to each other directly - they always need to talk through the controller. Suppose later you need to add new feature to the app by adding new sets of questions, you can only tap into the model and no need to modify the rest of the components. MVC is good for reusing components, and make the project modular. 

Right click the the Question.swift file, and click "New Group from Selection". Rename the folder "Model". Do the same th Main.storyboard file, and name the new group as "View". And the ViewController.swift file into "Controller" group. 

Right now, code in ViewController.swift:
```
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton! {
        didSet{
            trueButton.layer.cornerRadius = 20
        }
    }
    @IBOutlet weak var falseButton: UIButton! {
        didSet{
            falseButton.layer.cornerRadius = 20
        }
    }
    
    var questionIdx = 0
    
    let quiz = [
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonClicked(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        let actualAnser = quiz[questionIdx].answer
        
        if userAnswer == actualAnser {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        questionIdx = (questionIdx + 1) % quiz.count
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quiz[questionIdx].text
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = Float(questionIdx + 1) / Float(quiz.count)
    }
}
```

Create a new swift file in the model folder named QuizzBrain.swift, and put all quizz questions into a struct called "QuizBrain". Then also copy questionIdx into QuizBrain structure. In ViewController.swift, replace orgininal copied code with `var quizBrain = QuizBrain()`. 

Next, make QuizBrain to check whether the answer is correct or not. So add a method to the structure. Note the external and internal argument name in the function signature. The external argument name can also be ignored using `_`. 

```
// swift function with outputs and return types
func getMilk (money: Int) -> Int {
    let change = money - 2
    return change
}

var change = getMilk(money: 4)
```

In Swift, anything marked by the `let` keyword is immutable, while those marked as `var` are mutable. With a struct, we can think of `self` is a property that gets automatically created using the `let` keyword. So if we need to modify a property, from inside the struct, we need to add `mutating` keyword to the method. However, if we use `let myTown = Town()` instead of `var myTown = Town()`, then everything is immutable, even the mutating keyword inside will not help. 


## Final code
In ViewController.swift:
```
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton! {
        didSet{
            trueButton.layer.cornerRadius = 20
        }
    }
    @IBOutlet weak var falseButton: UIButton! {
        didSet{
            falseButton.layer.cornerRadius = 20
        }
    }
    @IBOutlet weak var scoreLabel: UILabel!
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonClicked(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let isCorrect = quizBrain.checkAnswer(userAnswer)
        if isCorrect {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        progressBar.progress = quizBrain.getProgress()
    }
}
```

In QuizBrain.swift:
```
import Foundation

struct QuizBrain {
    let quiz = [
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    var questionIdx = 0
    var score = 0

    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        let actualAnswer = quiz[questionIdx].answer
        if userAnswer == actualAnswer {
            score = score + 1
            return true
        } else {
            return false
        }
    }
    
    func getQuestionText() -> String {
        return quiz[questionIdx].text
    }
    
    func getProgress() -> Float {
        return Float(questionIdx + 1) / Float(quiz.count)
    }
    
    mutating func nextQuestion() {
        questionIdx = (questionIdx + 1) % quiz.count
        if questionIdx == 0 {
            score = 0
        }
    }
    func getScore() -> Int{
        return score
    }
}
```

In Question.swift:
```
import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
```



