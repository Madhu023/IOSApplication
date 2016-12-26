//
//  ViewController.swift
//  Food Tracker
//
//  Created by Madhusudhan G on 12/24/16.
//  Copyright © 2016 Madhusudhan G. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Handle the text field’s user input through delegate callbacks.
        _mealName.delegate = self
    }
    
    //MARK: Properties
    
    @IBOutlet weak var _mealName: UITextField!
    
    @IBOutlet weak var lbl_mealName: UILabel!
   
    
    //MARK: UI Text Field Delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        //Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField)
    {
        lbl_mealName.text = textField.text
    }
    
    
    //MARK: Actions
    
    @IBAction func btn_SetDefaultLabelText(sender: UIButton)
    {
        lbl_mealName.text = " Default Text"
    }
    

}

