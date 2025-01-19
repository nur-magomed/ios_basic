//
//  ViewController.swift
//  HW10
//
//  Created by Nur-Magomed Arsakhanov on 04.01.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    private var users: [User] = getUsers()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
    }

}

private func getUsers() -> [User] {
    var users = [User]()

    let user1 = User(id: 1, firstName: "John", lastName: "Doe", fatherName: "John Sr.", jobPosition: "Developer", address: "1 Main St.")
    let user2 = User(id: 2, firstName: "Jane", lastName: "Forest", fatherName: "John Sr.", jobPosition: "Singer", address: "2 Main St.")
    let user3 = User(id: 3, firstName: "Bob", lastName: "Smith", fatherName: "John Sr.", jobPosition: "Coach", address: "3 Main St.")
    let user4 = User(id: 4, firstName: "Joe", lastName: "Fox", fatherName: "John Sr.", jobPosition: "Teacher", address: "4 Main St.")
    let user5 = User(id: 5, firstName: "Alan", lastName: "Show", fatherName: "John Sr.", jobPosition: "Driver", address: "5 Main St.")
    users.append(user1)
    users.append(user2)
    users.append(user3)
    users.append(user4)
    users.append(user5)
    
    return users
}


extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
       1
     }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCellId", for: indexPath)
                as? UserTableViewCell else {
            return tableView.dequeueReusableCell(withIdentifier: "DefaultCellId", for: indexPath)
        }
        cell.setUserName("\(indexPath.row + 1). \(users[indexPath.row].firstName) \(users[indexPath.row].lastName)")
        return cell
   
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if [0].contains(section) {
            return "All users"
        }
        return nil
    }
    
}


extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "UserDetailsSegueId", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UserDetailsSegueId" {
            if let destinationVC = segue.destination as? UserDetailsViewController,
               let selectedIndexPath = tableView.indexPathForSelectedRow {
                destinationVC.user = users[selectedIndexPath.row]
            }
        }
    }
    
}

