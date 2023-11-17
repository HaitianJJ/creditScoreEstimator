//
//  personalViewController.swift
//  creditRemix
//
//  Created by Jason Jean on 10/25/23.
//

import UIKit

class personalViewController: UIViewController {
    
    
    
    @IBOutlet weak var firstNameInput: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func next(){
//        let resultVC = storyboard?.instantiateViewController(identifier: "result") as! resultViewController
//        resultVC.name = firstNameInput.text!
        
        let questionsVC = storyboard?.instantiateViewController(identifier: "questions") as! questionsViewController
        questionsVC.firstname = firstNameInput.text!
        questionsVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(questionsVC, animated: true)
    }
    

}
