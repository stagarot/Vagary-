//
//  InstrumentationRootViewController.swift
//  Computer Science IA
//

import UIKit

class InstrumentationRootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //sets an action for the clicking of the view
    @IBAction func add(_ sender: Any) {
        let viewControllers = self.childViewControllers
        if let vc = viewControllers[0] as? TableViewController {
            vc.add()
        }
    }
}
