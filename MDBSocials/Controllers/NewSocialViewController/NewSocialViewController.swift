//
//  NewSocialViewController.swift
//  MDBSocials
//
//  Created by Melanie Cooray on 2/20/19.
//  Copyright © 2019 Melanie Cooray. All rights reserved.
//

import UIKit

class NewSocialViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var nameOfEvent : UITextField!
    var eventDescription : UITextField!
    var imagePicker : UIImagePickerController!
    var imageButton : UIButton!
    var image : UIImageView!
    var datePicker : UIDatePicker!
    var selectedDate : String!

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
    
    func setUpDatePicker() {
        datePicker = UIDatePicker()
        datePicker.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
        datePicker.center = CGPoint(x: view.frame.width/2, y: eventDescription.frame.maxY + 50)
        datePicker.timeZone = NSTimeZone.local
        datePicker.backgroundColor = .white
        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        view.addSubview(datePicker)
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm a"
        let selectedDate: String = dateFormatter.string(from: sender.date)
        print("Selected value \(selectedDate)")
    }
}
