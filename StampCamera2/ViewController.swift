//
//  ViewController.swift
//  StampCamera2
//
//  Created by Kaori Persson on 2022-04.
//

import UIKit

class ViewController: UIViewController,  UINavigationControllerDelegate, UIImagePickerControllerDelegate, StampSelectViewControllerDelegate {
    
    
    @IBOutlet var stampBaseView: StampBaseView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let stampSelectVC = segue.destination as? StampSelectViewController {
            stampSelectVC.delegate = self
        }
    }
    
    @IBAction func cameraTapped(sender: UIButton) {
        showSourceSelection()
    }
    
    @IBAction func stampTapped(sender: UIButton) {
        performSegue(withIdentifier: "MainToStamp", sender: nil)
    }
    
    @IBAction func deleteTapped(sender: UIButton) {
        stampBaseView.deleteStamp()
    }
    
    @IBAction func saveTapped(sender: UIButton) {
        confirmSave()
    }
    
    func showSourceSelection() {
        // create alert
        let alert = UIAlertController(title: "Select image", message: "Please select image", preferredStyle: .alert)
        
        
        // aleart options
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action: UIAlertAction!) in
            self.pickImage(sourceType: .camera)
        }
        
        let libraryAction = UIAlertAction(title: "Photo Library", style: .default) { (action: UIAlertAction!) in
            self.pickImage(sourceType: .photoLibrary)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action: UIAlertAction!) in
            print("Pick canceled")
        }
        
        alert.addAction(cameraAction)
        alert.addAction(libraryAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func pickImage(sourceType: UIImagePickerController.SourceType){
        
        // check if the source type is available
        if UIImagePickerController.isSourceTypeAvailable(sourceType){
            let picker = UIImagePickerController()
            picker.sourceType = sourceType
            picker.delegate = self
            self.present(picker, animated: true, completion: nil)
        }
    }
    
    // delegate methods
    // This is executed when the image is picked
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            stampBaseView.setBackGroundImage(image: pickedImage)
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    func confirmSave() {
        let alert = UIAlertController(title: "Save Image", message: "Would you like to save the image?", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { (action: UIAlertAction!) in
            self.stampBaseView.saveImageWithStamps()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action: UIAlertAction!) in
            print("Save canceled")
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    // delegate method
    func didSelectStamp(stampImage: UIImage) {
        stampBaseView.addStamp(stampImage: stampImage)
    }


}

