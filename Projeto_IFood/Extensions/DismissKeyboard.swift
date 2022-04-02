//
//  DismissKeyboard.swift
//  Projeto_IFood
//
//  Created by Eduardo Oliveira on 02/04/22.
//

import Foundation
import UIKit

/*
 Extensão para dar dismiss no teclado quando clicar fora, ativamos essa funcionalidade colocando o comando:
    self.hideKeyboardWhenTappedAround()
 */

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
