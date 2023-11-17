//
//  questionsViewController.swift
//  creditRemix
//
//  Created by Jason Jean on 10/25/23.
//

import UIKit

class questionsViewController: UIViewController {
    
    var firstname: String?
    
    @IBOutlet weak var creditLength: UITextField!
    @IBOutlet weak var cardAmount: UITextField!
    @IBOutlet weak var cardsApplied: UITextField!
    @IBOutlet weak var creditBalance: UITextField!
    @IBOutlet weak var lineOfCredit: UITextField!
    @IBOutlet weak var missedPayments: UITextField!
    
    
    
    //public var completeionHandler: ((Double?) -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
        
        
        
        @IBAction func next() {
            let resultVC = storyboard?.instantiateViewController(identifier: "result") as! resultViewController
            resultVC.name = firstname
            resultVC.cardAmount = cardAmount.text
            resultVC.creditLength = creditLength.text
            resultVC.cardsApplied = cardsApplied.text
            resultVC.creditBalance = creditBalance.text
            resultVC.lineOfCredit = lineOfCredit.text
            resultVC.missedPayments = missedPayments.text
            resultVC.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(resultVC, animated: true)
            
            
            
            //        self.navigationController?.pushViewController(resultVC, animated: true)
        }
        
        

    
}
