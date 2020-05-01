//
//  TableViewController.swift
//  Computer Science IA
//
//  Created by Sara Tagarot on 2/20/18.
//  Copyright © 2018 Unknown. All rights reserved.
//

import UIKit

class TableViewController2: UITableViewController {
    //creates arrays one for the header of the 'Top Attractions' tableview and another with the ratings
    var headers = [ "Pyramid of the Sun",
                    "Frida Khalo Museum",
                    "Great Pyramid of Tenochtitlan",
                    "Angel of Independence",
                    "Museum Soumaya",
                    "Leon Trotsky Museum",
                    "Palace of Fine Arts",
                    "Zocalo",
                    "Chapultepec",
                    "Diego Rivera Mural Museum",
                    "Casa de los Azulejos"
    ]
    var data = [
        [
            "1 ★"
        ],[
            "2 ★"
        ],[
            "2 ★"
        ],[
            "3 ★"
        ],[
            "4 ★"
        ],[
            "4 ★"
        ],[
            "4 ★"
        ],[
            "5 ★"
        ],[
            "5 ★"
        ],[
            "6 ★"
        ],[
            "7 ★"
        ]
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // HELPS return the number of sections
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //HELPS return the number of rows
        return data[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "attraction", for: indexPath)
        
        //CHECK THIS!!!
        cell.textLabel?.text = data[indexPath.section][indexPath.row]  
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]
    }
    
    //adds the sections/headers into the tableview
    func add() {
        var newSection = data[0]
        newSection.append("")
        data[0] = newSection
        tableView.reloadData()
        let indexPath = IndexPath(item: data[0].count - 1, section: 0)
        tableView.selectRow(at:indexPath, animated: false, scrollPosition: .middle)
    }
    //adds cells under the sections/headers
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            var newData = data[indexPath.section]
            newData.remove(at: indexPath.row)
            data[indexPath.section] = newData
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "seg", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EditorViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                let attraction = headers[indexPath.section]
                destination.attractionName = attraction
                destination.completion = { (newAttraction) in
                    self.data[indexPath.section][indexPath.row] = newAttraction
                    self.tableView.reloadData()
                }
            }
        }
    }
 
}
