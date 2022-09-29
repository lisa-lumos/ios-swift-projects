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























