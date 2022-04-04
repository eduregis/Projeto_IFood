//
//  AlertHelper.swift
//  Projeto_IFood
//
//  Created by Eduardo Oliveira on 04/04/22.
//

import UIKit

// Classe para simplificar a criação de Alerts numa viewController
class AlertHelper {
    static func defaultAlert(over viewController: UIViewController,
                             title: String,
                             message: String,
                             defaultActionTitle: String,
                             completion: ((UIAlertAction) -> Void)? = nil) {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let continueAction = UIAlertAction(title: defaultActionTitle,
                                           style: .default,
                                           handler: completion)
        
        alert.addAction(continueAction)
        viewController.present(alert, animated: true, completion: nil)
    }
}
