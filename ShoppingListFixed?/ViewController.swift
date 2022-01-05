//
//  ViewController.swift
//  ShoppingListHackwitch
//
//  Created by Connor Reed on 1/3/22.
//

import UIKit

class Item{
    var name:String
    var quantity:Int
    init(name:String, quantity:Int){
        self.name = name
        self.quantity = quantity
    }
}



class ViewController: UIViewController,
                      UITableViewDataSource,
                      UITableViewDelegate{
    var items: [Item] = []
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let currentItem = items[indexPath.row]
        cell.textLabel?.text = currentItem.name
        cell.detailTextLabel?.text = "X\(currentItem.quantity)"
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.resignFirstResponder()
        self.view.window?.resignFirstResponder()
        self.view.window?.endEditing(true)
        let svc = self.storyboard?.instantiateViewController(withIdentifier: "Detail") as! DetailsViewController
        svc.item = items[indexPath.row]
        //self.navigationController?.pushViewController(svc, animated: true)
        //present(svc, animated: true)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    

    @IBOutlet weak var itemInput: UITextField!
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        items.append(Item(name:"Milk", quantity: 2))
        items.append(Item(name:"Cheese", quantity: 1))
        items.append(Item(name:"Eggs", quantity: 12))
        items.append(Item(name:"Steak", quantity: 3))
        
        
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func itemSubmit(_ sender: Any) {
        if let itemName = self.itemInput.text{
            let quantity = 1
            let item = Item(name: itemName, quantity: quantity)
            items.append(item)
            tableView.reloadData()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.view.window?.endEditing(true)
        self.itemInput.endEditing(true)
        self.itemInput.endEditing(true)
        self.itemInput.resignFirstResponder()
        if let indexPath = tableView.indexPathForSelectedRow{
            self.resignFirstResponder()
            self.navBar.titleView?.resignFirstResponder()
            self.itemInput.resignFirstResponder()
            let segueDestination = segue.destination as! DetailsViewController
            segueDestination.item = items[indexPath.row]
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("\n\n\n end editing \n\n\n")
        super.viewWillDisappear(animated)
        self.itemInput.endEditing(true)
        self.itemInput.resignFirstResponder()
        self.itemInput.endEditing(true)
        self.navBar.titleView?.endEditing(true)
        self.navBar.titleView?.resignFirstResponder()
        self.resignFirstResponder()
        self.view.window?.endEditing(true)
    }
    

}
