//
//  HomeViewController.swift
//  myTube
//
//  Created by technomix on 16.03.23.
//

import UIKit

class HomeViewController: UIViewController{
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    var fetchedCategories = DataSource.shared.categories
    var filtering : [AppCategories] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        filtering = fetchedCategories
        configureNavigationBar(largeTitleColor: .gray, backgoundColor: .systemYellow, tintColor: .gray, title: "Home", preferredLargeTitle: true)
        setUpTableView()
        navigationItem.backButtonTitle = ""
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
  
    private func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CategoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "CategoriesTableViewCell")
    }
    
    

   

}
extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filtering.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesTableViewCell", for: indexPath) as! CategoriesTableViewCell
        cell.configure(with: filtering[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row{
        case 1 :
            let vc = UIStoryboard(name: "SportsCategories", bundle: nil).instantiateViewController(withIdentifier: "Sport")
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
        
       
    }
    
    
}
