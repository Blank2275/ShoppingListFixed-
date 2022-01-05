//
//  DetailsViewController.swift
//  ShoppingListHackwitch
//
//  Created by Connor Reed on 1/5/22.
//

import UIKit

class DetailsViewController: UIViewController {
    var item:Item!
    @IBOutlet weak var quantityLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.item.name
        self.quantityLabel.text = "Quantity:\(self.item.quantity)"
        // Do any additional setup after loading the view.
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
