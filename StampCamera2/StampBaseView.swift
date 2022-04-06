//
//  StampBaseView.swift
//  StampCamera2
//
//  Created by Kaori Persson on 2022-04-06.
//

import UIKit

class StampBaseView: UIView {

    @IBOutlet var backgroundImageView: UIImageView!
    
    func setBackGroundImage(image: UIImage){
        backgroundImageView.image = image
    }
    
    func addStamp(stampImage: UIImage){
        let size = 100
        let stampView = StampView()
    }

}
