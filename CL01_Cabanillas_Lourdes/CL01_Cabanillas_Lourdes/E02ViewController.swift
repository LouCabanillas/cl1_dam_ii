//
//  E02ViewController.swift
//  CL01_Cabanillas_Lourdes
//
//  Created by Cibertec on 1/05/24.
//

import UIKit
import CoreData

var tasks = [NSManagedObject]()

class E02ViewController: ViewController, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tablaTareasData.dequeueReusableCell(withIdentifier: "Cell")
        cell!.textLabel!.text = tasks[indexPath.row].value(forKey: "name") as? String
        return cell!
    }
    

    @IBOutlet weak var tablaTareasData: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tablaTareasData.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<NSManagedObject> = NSFetchRequest(entityName: "Task")


        do{
            let results = try managedContext.fetch(fetchRequest)
            tasks = results as [NSManagedObject]
        }catch let error as NSError{
            print("Error al cargar la data")
        }
    }
    
    
    @IBAction func agregarTareasDataButton(_ sender: Any) {
        let alert = UIAlertController(title: "Ingresar Tarea", message: nil, preferredStyle: .alert)
                alert.addTextField{
                    (textField) in textField.placeholder = "Ingrese la tarea a guardar"
                }
                alert.addAction(UIAlertAction(title: "Guardar tarea", style: .default){(_) in
                    let texto = alert.textFields!.first
                    print(texto!.text!)
                    self.guardarTarea(tareaNueva: texto!.text!)
                    self.tablaTareasData.reloadData()
                })
                alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
                present(alert,animated: true,completion: nil)
    }
    
    
    func guardarTarea(tareaNueva:String){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Task", in: managedContext)
        
        let task = NSManagedObject(entity: entity!, insertInto: managedContext)
        task.setValue(tareaNueva, forKey: "name")
        
        do{
            try managedContext.save()
            
            tasks.append(task)
        }catch let error as NSError{
            print("No se ha podido guardar el error")
        }
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
