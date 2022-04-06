//
//  StampView.swift
//  StampCamera2
//
//  Created by Kaori Persson on 2022-04.
//

import UIKit

enum StampScale {
    case small
    case medium
    case large
}

class StampView: UIImageView {
    
    var currentTouche: UITouch!
    
    // Add double tap gesture for resizing the stamp
    // executed when it's instanciate in super view
    override func didMoveToWindow() {
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        doubleTap.numberOfTapsRequired = 2
        self.addGestureRecognizer(doubleTap)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.superview?.bringSubviewToFront(self)
        currentTouche = touches.first
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let touch = touches.first else {return}
        
        let dx = touch.location(in: self.superview).x - touch.previousLocation(in: self.superview).x
        let dy = touch.location(in: self.superview).y - touch.previousLocation(in: self.superview).y
        self.center = CGPoint(x: self.center.x + dx, y: self.center.y + dy)
    }
    
    @objc func doubleTapped(){
        print(self)
        let size:CGFloat = 20
        self.frame = CGRect(x: currentTouche.location(in: self.superview).x, y: currentTouche.location(in: self.superview).y, width: size, height: size)
        //self.center = self.superview!.center

    }

}
