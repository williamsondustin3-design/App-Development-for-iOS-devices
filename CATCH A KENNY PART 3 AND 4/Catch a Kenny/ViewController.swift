//
//  ViewController.swift
//  Catch a Kenny
//
//  Created by  on 10/20/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var kenny1: UIImageView!
    @IBOutlet weak var kenny2: UIImageView!
    @IBOutlet weak var kenny3: UIImageView!
    @IBOutlet weak var kenny4: UIImageView!
    @IBOutlet weak var kenny5: UIImageView!
    @IBOutlet weak var kenny6: UIImageView!
    @IBOutlet weak var kenny7: UIImageView!
    @IBOutlet weak var kenny8: UIImageView!
    @IBOutlet weak var kenny9: UIImageView!
    
    var score = 0
    var timer = Timer()
    var counter = 0
    var kennyArray = [UIImageView]()
    var hideTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "Score: \(score)"
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        kenny1.addGestureRecognizer(recognizer1)
        kenny1.isUserInteractionEnabled = true
        
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        kenny2.addGestureRecognizer(recognizer2)
        kenny2.isUserInteractionEnabled = true
        
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        kenny3.addGestureRecognizer(recognizer3)
        kenny3.isUserInteractionEnabled = true
        
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        kenny4.addGestureRecognizer(recognizer4)
        kenny4.isUserInteractionEnabled = true
        
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        kenny5.addGestureRecognizer(recognizer5)
        kenny5.isUserInteractionEnabled = true
        
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        kenny6.addGestureRecognizer(recognizer6)
        kenny6.isUserInteractionEnabled = true
        
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        kenny7.addGestureRecognizer(recognizer7)
        kenny7.isUserInteractionEnabled = true
        
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        kenny8.addGestureRecognizer(recognizer8)
        kenny8.isUserInteractionEnabled = true
        
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        kenny9.addGestureRecognizer(recognizer9)
        kenny9.isUserInteractionEnabled = true
        
        kennyArray = [kenny1, kenny2, kenny3, kenny4, kenny5, kenny5, kenny6, kenny7,
        kenny8, kenny9]
        
        counter = 10
        timeLabel.text = "\(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1,target: self,selector:#selector(countdown),userInfo:nil,repeats:true)
        
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideKenny), userInfo: nil, repeats: true)
        
        hideKenny()
        
        }
        // Do any additional setup after loading the view.
    
    @objc func increaseScore() {
        score += 1
        scoreLabel.text = "Score: \(score)"
        }
    @objc func countdown() {
        counter -= 1
        timeLabel.text = "\(counter)"
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            let alert = UIAlertController(title: "Time's Up",message: "Do you want to play again?",preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel,handler: nil)
            let replayButton = UIAlertAction(title: "Replay",style: UIAlertAction.Style.default) {
                (UIAlertAction) in
            }
            alert.addAction(okButton)
            alert.addAction(replayButton)
            for kenny in kennyArray {
                kenny.isHidden = true
            }
            
            present(alert, animated:true, completion: nil)
        }
    }
    @objc func hideKenny() {
        for kenny in kennyArray {
            kenny.isHidden = true
        }
        let random = Int(arc4random_uniform(UInt32(kennyArray.count-1)))
        kennyArray[random].isHidden = false
    }

}

