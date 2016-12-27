//
//  ViewController.swift
//  Food Tracker
//
//  Created by Madhusudhan G on 12/24/16.
//  Copyright © 2016 Madhusudhan G. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,
                      UINavigationControllerDelegate
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
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    
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
    
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer)
    {
        //Hide the keyboard
        _mealName.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .PhotoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    

    //MARK:  UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController)
    {
        // Dismiss the picker if the user canceled.
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
            else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}

