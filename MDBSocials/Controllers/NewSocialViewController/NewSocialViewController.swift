//
//  NewSocialViewController.swift
//  MDBSocials
//
//  Created by Melanie Cooray on 2/20/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit
import Firebase

class NewSocialViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var nameOfEvent : UITextField!
    var eventDescription : UITextField!
    var imagePicker : UIImagePickerController!
    var imageButton : UIButton!
    var image : UIImage!
    var datePicker : UIDatePicker!
    var selectedDate : String!
    var addButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setUpImagePicker()
    }
    
    func setUpImagePicker() {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.image = info[.originalImage] as? UIImage
        imagePicker.dismiss(animated: true, completion: nil)
        //guard let self.image = info[]
        
    }
    
    @objc func uploadImage() {
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm a"
        selectedDate = dateFormatter.string(from: sender.date)
        print("Selected value \(selectedDate)")
    }
    
    @objc func addToFeed() {
        guard let eventName = nameOfEvent.text else {
            self.addButton.isUserInteractionEnabled = true
            showError(title: "Information Missing", message: "No Event Name Entered.")
            return
        }
        
        guard let eventDesc = eventDescription.text else {
            self.addButton.isUserInteractionEnabled = true
            showError(title: "Information Missing", message: "No Description Entered.")
            return
        }
        
        guard let eventImage = image else {
            self.addButton.isUserInteractionEnabled = true
            showError(title: "Information Missing", message: "No Event Picture Selected.")
            return
        }
        
        guard let eventDate = selectedDate else {
            self.addButton.isUserInteractionEnabled = true
            showError(title: "Information Missing", message: "No Event Date Selected.")
            return
        }
        
        print(selectedDate)
        let db = Database.database().reference()
        let eventNode = db.child("events")
        let eventID = eventNode.childByAutoId().key
        db.child("events").child(eventID!).setValue(["name" : eventName, "description" : eventDesc, "date" : eventDate, "interested" : 1, "host" : Auth.auth().currentUser?.displayName])
        //db.child("events").child(eventID!).setValue(["name" : eventName, "description" : eventDesc, "date" : eventDate, "interested" : 1, "host" : Auth.auth().currentUser().Name])
        
        let storage = Storage.storage().reference()
        if let data = image.jpegData(compressionQuality: 0.4) {
            storage.child("\(eventName).jpeg").putData(data, metadata: nil, completion: { (metadata, error) in
                if error != nil {
                    self.showError(title: "Error:", message: "Could not upload image.")
                    return
                }
                print(metadata)
            })
        }
        
        /*
        let data = image.jpegData(compressionQuality: 0.4)
        storage.child("images").putData(data!, metadata: nil) { (data, error) in
            if error != nil {
                self.showError(title: "Error:", message: "Could not upload image.")
            }
        }
        */
        self.performSegue(withIdentifier: "addedEvent", sender: self)
    }
    
    func showError(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
}
