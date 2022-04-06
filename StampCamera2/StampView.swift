//
//  StampView.swift
//  StampCamera2
//
//  Created by Kaori Persson on 2022-04-06.
//

import UIKit

class StampView: UIImageView {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.superview?.bringSubviewToFront(self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first else {return}
        
        let dx = touch.location(in: self.superview).x - touch.previousLocation(in: self.superview).x
        let dy = touch.location(in: self.superview).y - touch.previousLocation(in: self.superview?).y
        self.center = CGPoint(x: self.center.x + dx, y: self.center.y + dy)
    }

}
