//
//  resultViewController.swift
//  creditRemix
//
//  Created by Jason Jean on 10/25/23.
//

import UIKit

class resultViewController: UIViewController {
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var creditScore: UILabel!
    var name: String?
    var score: Double?
   
    var creditLength: String?
    var cardAmount: String?
    var cardsApplied: String?
    var creditBalance: String?
    var lineOfCredit: String?
    var missedPayments: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstName.text = "Hello \(name!)"
        creditScore.text = " "
        score = oldestCard() + creditMix() + applied() + creditUtil() + payHistory()

    }
    
    
     
     func oldestCard() -> Double {
         if let creditLengthText = creditLength, let num = Int(creditLengthText) {
             var points: Double = 0.0
             let maxPoints: Double = 0.75
             
             if (0...2).contains(num) {
                 points = maxPoints * 0.25
             } else if (3...7).contains(num) {
                 points = maxPoints * 0.5
             } else if (8...10).contains(num) {
                 points = maxPoints * 0.75
             } else if num > 15 {
                 points = maxPoints
             }
             return points
         }
         else {return 0.0
         }
     }
     
     func applied() -> Double {
         if let cardsAppliedText = cardsApplied, let num = Int(cardsAppliedText) {
             var points: Double = 0.0
             let maxPoints: Double = 0.5
             
             if (0...2).contains(num) {
                 points = maxPoints * 0.25
             } else if (3...5).contains(num) {
                 points = maxPoints * 0.5
             } else if (6...8).contains(num) {
                 points = maxPoints * 0.75
             } else if num > 9 {
                 points = maxPoints
             }
             return points
         }
         else {return 0.0
         }
     }
     
     func creditMix() -> Double {
         if let cardAmountText = cardAmount, let num = Int(cardAmountText){
             var points: Double = 0.0
             let maxPoints: Double = 0.5
             
             if (0...1).contains(num) {
                 points = maxPoints * 0.25
             } else if (2...4).contains(num) {
                 points = maxPoints * 0.5
             } else if (5...8).contains(num) {
                 points = maxPoints * 0.75
             } else if num > 9 {
                 points = maxPoints
             }
             return points
         }
         else {return 0.0
         }
     }
     
     func creditUtil() -> Double{
         if let creditBalanceText = creditBalance, let lineOfCreditText = lineOfCredit, let num1 = Double(creditBalanceText), let num2 = Double(lineOfCreditText) {
             let percent = Double(num1/num2)
             var points: Double = 0.0
             let maxPoints: Double = 1.5
             
             if (0...0.1).contains(percent) {
                 points = maxPoints
             } else if (0.11...0.3).contains(percent) {
                 points = maxPoints * 0.75
             } else if (0.31...0.6).contains(percent) {
                 points = maxPoints * 0.5
             } else if  (0.61...1).contains(percent) {
                 points = maxPoints * 0.25
             }
             return points
         }
         else {return 0.0
         }
         
     }
     
     func payHistory() -> Double{
         if let missedPaymentsText = missedPayments, let num = Int(missedPaymentsText){
             var points: Double = 0.0
             let maxPoints: Double = 1.75
             
             if num == 0{
                 points = maxPoints
             }
             else if missedPayments == "Never" {
                 points = maxPoints
             }
             else if missedPayments == "never" {
                 points = maxPoints
             }
             else if (1...2).contains(num){
                 points = maxPoints * 0.1
             }
             else if (3...6).contains(num){
                 points = maxPoints * 0.2
             }
             else if (7...9).contains(num){
                 points = maxPoints * 0.3
             }
             else if (10...13).contains(num){
                 points = maxPoints * 0.7
             }
             else if (13...16).contains(num){
                 points = maxPoints * 0.8
             }
             else if (17...18).contains(num){
                 points = maxPoints * 0.9
             }
             else if num > 19{
                 points = maxPoints
             }
             return points
         }
         else{ return 0.0}
     }
         
    func calcResult() -> String{
        let rawResult = score!
        var result = " "

        if  (0.0...0.5).contains(rawResult) {
            result = "300 - 500"
        }
        else if(0.51...0.99).contains(rawResult) {
        result = "500 - 600"
        }
        else if (1...2).contains(rawResult) {
        result = "601 - 657"
        }
        else if (2.0...2.9).contains(rawResult) {
            result = "658 - 719"
        } else if (3.0...3.9).contains(rawResult) {
            result = "720 - 780"
        } else if rawResult  >= 4 {
            result = "781 - 850"
        }

        return result
    }
    
         @IBAction func viewResult(){
             var calculated = calcResult()
             creditScore.text = "\(String(describing: calculated))"
         }
        
    
        
    
        
//        let personalVC = storyboard?.instantiateViewController(identifier: "personal") as! personalViewController
//        personalVC.completeionHandler = {text in self.firstName.text = " Hello \(text)"}
//        //personalVC.modalPresentationStyle = .fullScreen
//        //present(personalVC, animated: true)
//
//        let questionsVC = storyboard?.instantiateViewController(identifier: "questions") as! questionsViewController
//        questionsVC.completeionHandler = {text in self.creditScore.text = "\(text)"}// prolly a cleaner way to convert to string
//        //questionsVC.modalPresentationStyle = .fullScreen
//        //present(questionsVC, animated: true)
}

    


