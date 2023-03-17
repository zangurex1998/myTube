//
//  NBACategoiresViewController.swift
//  myTube
//
//  Created by technomix on 17.03.23.
//

import UIKit

class NBACategoiresViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!

    var shared = NBADataSource.shared.data
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        configureNavigationBar(largeTitleColor: .gray, backgoundColor: .systemYellow, tintColor: .gray, title: "Categories", preferredLargeTitle: true)
        navigationItem.backButtonTitle = ""
    }
    
    private func setUpTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "NBACategoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "NBACategoriesTableViewCell")
    }
    
    deinit {
        print("This Page is Deinited!!")
    }

    

}
extension NBACategoiresViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        shared.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NBACategoriesTableViewCell", for: indexPath) as! NBACategoriesTableViewCell
        cell.configure(with: shared[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row{
        case 0 :
            let vc = UIStoryboard(name: "BasketBallCategories", bundle: nil).instantiateViewController(withIdentifier: "basketballCategories")
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = UIStoryboard(name: "AllStar", bundle: nil).instantiateViewController(withIdentifier: "allStar")
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = UIStoryboard(name: "Christmas", bundle: nil).instantiateViewController(withIdentifier: "christmas")
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = UIStoryboard(name: "BestOf", bundle: nil).instantiateViewController(withIdentifier: "bestOf")
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
    
    
}
