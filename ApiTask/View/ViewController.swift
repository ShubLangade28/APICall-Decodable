
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTable: UITableView!
    var userAllInfo = [Users]()
    
    let api = ApiManager()
    var apiCallOnes = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.delegate = self
        myTable.dataSource = self
        title = "UserProfile"
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if apiCallOnes == false
        {
            callAPI()
            apiCallOnes = true
        }
    }
    
    private func callAPI()
    {
        api.getData { (userDetails) in
            self.userAllInfo = userDetails
            DispatchQueue.main.async {
                self.myTable.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        let user = userAllInfo[indexPath.row]
        secondVC.id = user.id
        secondVC.name = user.name
        secondVC.userName = user.username
        secondVC.email = user.email
        secondVC.address = user.address.city + user.address.street + user.address.suite + user.address.zipcode + user.address.geo.lat + user.address.geo.lng
        secondVC.phone = user.phone
        secondVC.website = user.website
        secondVC.company = user.company.name + user.company.catchPhrase + user.company.bs
        navigationController?.pushViewController(secondVC, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userAllInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: "cellS")
        cell?.textLabel?.text = userAllInfo[indexPath.row].name
        cell?.detailTextLabel?.text = userAllInfo[indexPath.row].email
        return cell!
    }
    
}

