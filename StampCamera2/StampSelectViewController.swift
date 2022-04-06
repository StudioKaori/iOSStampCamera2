//
//  StampSelectViewController.swift
//  StampCamera2
//
//  Created by Kaori Persson on 2022-04.
//

protocol StampSelectViewControllerDelegate: class {
    func didSelectStamp(stampImage: UIImage)
}

import UIKit

class StampSelectViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var stampImages = [UIImage]()
    
    weak var delegate: StampSelectViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...4 {
            if let image = UIImage(named: "stamp\(i).png") {
                stampImages.append(image)
            }
        }

    }
    
    @IBAction func close(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stampImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StampCell", for: indexPath)
        
        if let stampImageView = cell.viewWithTag(1) as? UIImageView {
            stampImageView.image = stampImages[indexPath.row]
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectStamp(stampImage: stampImages[indexPath.row])
        self.dismiss(animated: true, completion: nil)
    }

}
