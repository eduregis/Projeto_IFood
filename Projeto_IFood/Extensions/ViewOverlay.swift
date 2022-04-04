//
//  ViewOverlay.swift
//  Projeto_IFood
//
//  Created by Eduardo Oliveira on 03/04/22.
//

import UIKit

/*
 Extensão para dar adicionar um filtro escuro com opacidade regulável em qualquer UIView, ativamos essa funcionalidade colocando o comando:
    view.addOverlay()
 E podemos manipular a cor e a instensidade do overlay pelas variáveis, por exemplo:
    view.addOverlay(color: .red, alpha: 0.3)
 */

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
