//
//  UIButtonExtension.swift
//  CL01_Cabanillas_Lourdes
//
//  Created by Cibertec on 1/05/24.
//

import UIKit

extension UIButton {
    
    // Redondear el borde del botón con un radio específico
    func round() {
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    // Cambiar el color de fondo del botón
    func bounce() {
        UIView.animate(withDuration: 0.5){
            self.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        } completion: { (completion) in
            UIView.animate(withDuration: 0.5) {
                self.transform = .identity
            }
        }
        
    }
}
