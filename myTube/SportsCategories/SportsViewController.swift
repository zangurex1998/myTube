//
//  SportsViewController.swift
//  myTube
//
//  Created by technomix on 16.03.23.
//

import UIKit

class SportsViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var fetchedSport = SportDataSource.sportShared.sports
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
       
        navigationItem.backButtonTitle = ""
        if #available(iOS 13.0, *) {
            configureNavigationBar(largeTitleColor: .gray, backgoundColor: .systemYellow, tintColor: .gray, title: "Sports", preferredLargeTitle: true)
        } else {
            // Fallback on earlier versions
        }
      
    }
    
    //MARK: - Deinit
    deinit {
        print("Page Deinited")
    }
    
    private func setUpTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "SportTableViewCell", bundle: nil), forCellReuseIdentifier: "SportTableViewCell")
      
    }
 

}

extension SportsViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fetchedSport.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SportTableViewCell", for: indexPath) as! SportTableViewCell
        cell.configure(with: fetchedSport[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dismiss(animated: true)
        switch indexPath.row{
        case 0 :
            let vc = UIStoryboard(name: "Football", bundle: nil).instantiateViewController(withIdentifier: "football")
            navigationController?.pushViewController(vc, animated: true)
        case 2 :
            let vc = UIStoryboard(name: "UFC", bundle: nil).instantiateViewController(withIdentifier: "ufc")
            navigationController?.pushViewController(vc, animated: true)
        case 1 :
            let vc = UIStoryboard(name: "NBACategories", bundle: nil).instantiateViewController(withIdentifier: "nbaCategory")
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
    
    
}
