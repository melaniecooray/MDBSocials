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
    var image : UIImageView!
    var datePicker : UIDatePicker!
    var selectedDate : String!
    var addButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initUI()
        setUpImagePicker()
    }
    
    func setUpImagePicker() {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.image.image = info[.originalImage] as? UIImage
    }
    
    @objc func uploadImage() {
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm a"
        selectedDate = dateFormatter.string(from: sender.date)
        print("Selected value \(selectedDate)")
    }
    
    @objc func addToFeed() {
        print(selectedDate)
        let db = Database.database().reference()
        let eventNode = db.child("events")
        let eventID = eventNode.childByAutoId().key
        db.child("events").child(eventID!).setValue(["name" : nameOfEvent.text, "description" : eventDescription.text, "date" : selectedDate, "interested" : 1, "host" : Auth.auth().currentUser?.displayName])
    }
}
