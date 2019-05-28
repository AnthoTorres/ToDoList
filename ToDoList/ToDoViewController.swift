//
//  ToDoViewController.swift
//  ToDoList
//
//  Created by Anthony Torres on 5/27/19.
//  Copyright © 2019 Anthony Torres. All rights reserved.
//

import UIKit

protocol ToDoItemDelegate {
    func didSave(toDoItem: String)
    
}



class ToDoViewController: UIViewController {

    @IBOutlet weak var toDoTextField: UITextField!
    var delegate: ToDoItemDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .blue
        
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveToDoItem))
        navigationItem.rightBarButtonItem = saveButton
        
        

        // Do any additional setup after loading the view.
    }
    
    @objc func saveToDoItem() {
        print("Saved")
        delegate?.didSave(toDoItem: toDoTextField.text ?? "")
        self.navigationController?.popViewController(animated: true)
        
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
