//
//  ToDoListTableViewController.swift
//  ToDoList
//
//  Created by Anthony Torres on 5/27/19.
//  Copyright © 2019 Anthony Torres. All rights reserved.
//

import UIKit



class ToDoListTableViewController: UITableViewController, ToDoItemDelegate {

    var toDoList:[String] = []
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = "To-Do-List"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addToDoItem))
        navigationItem.rightBarButtonItems = [add]
    }

    
    func didSave(toDoItem: String) {
        toDoList.append(toDoItem)
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            toDoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = toDoList[indexPath.row]
        
        // Configure the cell...
        
        return cell
    }
    
    @objc func addToDoItem() {
        print("Button Pressed")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let viewController = storyboard.instantiateViewController(withIdentifier: "ToDoView") as? ToDoViewController {
            viewController.delegate = self
            
            self.navigationController?.pushViewController(viewController, animated: true)
        }
//        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
