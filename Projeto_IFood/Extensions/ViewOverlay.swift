//
//  ViewOverlay.swift
//  Projeto_IFood
//
//  Created by Eduardo Oliveira on 03/04/22.
//

import UIKit

extension UIView {
    
    func addOverlay(color: UIColor = .black, alpha: CGFloat = 0.6) {
        let overlay = UIView()
        overlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        overlay.frame = bounds
        overlay.backgroundColor = color
        overlay.alpha = alpha
        addSubview(overlay)
    }
    
}
