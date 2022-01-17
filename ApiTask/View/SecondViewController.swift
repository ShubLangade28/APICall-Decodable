//
//  SecondViewController.swift
//  ApiTask
//
//  Created by Mac on 09/01/22.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    
    var id = 0
    var name = ""
    var userName = ""
    var email = ""
    var address = ""
    var phone = ""
    var website = ""
    var company = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        idLabel.text = String(id)
        nameLabel.text = name
        userNameLabel.text = userName
        emailLabel.text = email
        addressLabel.text = address
        phoneLabel.text = phone
        websiteLabel.text = website
        companyLabel.text = company
        title = "Detailed Information"

    }
}
