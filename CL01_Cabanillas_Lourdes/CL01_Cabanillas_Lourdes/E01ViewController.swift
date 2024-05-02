//
//  E01ViewController.swift
//  CL01_Cabanillas_Lourdes
//
//  Created by Cibertec on 1/05/24.
//

import UIKit

class E01ViewController: UIViewController {

    
    @IBOutlet weak var listarTextoButton: UIButton!
    @IBOutlet weak var eliminarTextoButton: UIButton!
    @IBOutlet weak var agregarTextoButton: UIButton!
    
    private var lblKey = "TEXTO"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func mostrarAlerta(titulo:String, mensaje:String){
        let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
        present(alert,animated: true,completion: nil)
    }
    
    
    @IBAction func listarTexto(_ sender: Any) {
        let defaults = UserDefaults.standard
        if let textGuardado = defaults.string(forKey: lblKey){
            self.mostrarAlerta(titulo: "Consultar Texto", mensaje: "Texto Guardado: \(String(describing: textGuardado))")
        }else{
             self.mostrarAlerta(titulo: "Consultar Texto", mensaje: "Texto no encontrado.")
        }
    }
    
    
    @IBAction func eliminarTexto(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: lblKey)
        self.mostrarAlerta(titulo: "Elimina Texto", mensaje: "Texto eliminado Correctamente.")
    }
    
    
    @IBAction func agregarTexto(_ sender: Any) {
        let defaults = UserDefaults.standard
        let alert = UIAlertController(title: "Ingresar Texto", message: nil, preferredStyle: .alert)
        alert.addTextField{
            (textField) in textField.placeholder = "Ingrese el texto a guardar"
        }
        alert.addAction(UIAlertAction(title: "Guardar texto", style: .default){(_) in
            if let texto = alert.textFields?.first?.text{
                defaults.set(texto, forKey: self.lblKey)
                self.mostrarAlerta(titulo:"Guardar Texto",mensaje:"Texto guardado correctamente.")
            }
        })
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        present(alert,animated: true,completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
