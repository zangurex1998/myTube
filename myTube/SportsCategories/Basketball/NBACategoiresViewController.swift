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
    
    
}
