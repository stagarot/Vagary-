//
//  TableViewController.swift
//  Computer Science IA
//
//  Created by Sara Tagarot on 2/20/18.
//  Copyright © 2018 Unknown. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    //creates arrays one for the header of the 'Nearest Attractions' tableview and another with the distances
    var headers = [ "Angel of Independence",
                    "Zocalo",
                    "Chapultepec",
                    "Palace of Fine Arts",
                    "Casa de los Azulejos",
                    "Great Pyramid of Tenochtitlan",
                    "Diego Rivera Mural Museum",
                    "Museum Soumaya",
                    "Frida Khalo Museum",
                    "Leon Trotsky Museum",
                    "Pyramid of the Sun"
    ]
    var data = [
        [
            "0 km"
        ],[
            "2 km"
        ],[
            "3 km"
        ],[
            "3 km"
        ],[
            "4 km"
        ],[
            "5 km"
        ],[
            "5 km"
        ],[
            "6 km"
        ],[
            "11 km"
        ],[
            "17 km"
        ],[
            "51 km"
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
                let attraction = headers[indexPath.section] //Since you added a section per each attraction you need to select the header from the section  part
                destination.attractionName = attraction
                destination.completion = { (newAttraction) in
                    self.data[indexPath.section][indexPath.row] = newAttraction
                    self.tableView.reloadData()
                }
            }
        }
    }
 
}
