//
//  AllStarViewController.swift
//  myTube
//
//  Created by technomix on 17.03.23.
//

import UIKit

class AllStarViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    var fetchedAllstar: [FetchAllstar] = []{
        didSet{
            self.tableView.reloadData()
        }
    }
    var allStar: AllStarProtocol = AllStarAPiManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        navigationItem.backButtonTitle = ""
        allStar.fetchAllStar { [weak self] fetchData in
            self?.fetchedAllstar = fetchData.NBAallStar
        }
        configureNavigationBar(largeTitleColor: .gray, backgoundColor: .systemYellow, tintColor: .gray, title: "All Star", preferredLargeTitle: false)
        
    }
    
    deinit {
        print("Successfull Deinitialization")
    }
    
    private func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "AllStarTableViewTableViewCell", bundle: nil), forCellReuseIdentifier: "AllStarTableViewTableViewCell")
    }
    
}
extension AllStarViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fetchedAllstar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllStarTableViewTableViewCell", for: indexPath) as! AllStarTableViewTableViewCell
        cell.configure(with: fetchedAllstar[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "FootballVideo", bundle: nil).instantiateViewController(withIdentifier: "footballVideoPlayer") as! FootballVideoViewController
        vc.navigationTitle = fetchedAllstar[indexPath.row].videoName
        vc.videoLink = fetchedAllstar[indexPath.row].videolink
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
