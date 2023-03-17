//
//  FootballViewController.swift
//  myTube
//
//  Created by technomix on 16.03.23.
//

import UIKit

class FootballViewController: UIViewController {
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Properties
    var fetchedFootball: FootballAPiManagerProtocol = FootballApiManager()
    var footballs : [football] = []{
        didSet{ self.tableView.reloadData()}
    }
    
    var searchController = UISearchController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        fetchedFootball.fetchFootball { [weak self] football in
            self?.footballs = football.football
        }
        if #available(iOS 13.0, *) {
            configureNavigationBar(largeTitleColor: .gray, backgoundColor: .systemYellow, tintColor: .gray, title: "Football", preferredLargeTitle: true)
        } else {
            // Fallback on earlier versions
        }
        setUpSearchController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    if #available(iOS 13.0, *) {
        configureNavigationBar(largeTitleColor: .gray, backgoundColor: .systemYellow, tintColor: .gray, title: "Football", preferredLargeTitle: true)
    } else {
        // Fallback on earlier versions
    }
    }
    
    private func setUpSearchController(){
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
    }
    
    deinit {
        print("Football Page Deinited!")
    }
    
    private func setUpTableView(){
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FootballTableViewCell", bundle: nil), forCellReuseIdentifier: "FootballTableViewCell")
        tableView.delegate = self
    }
    
    

}
extension FootballViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        footballs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FootballTableViewCell", for: indexPath) as! FootballTableViewCell
        cell.configure(with: footballs[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "FootballVideo", bundle: nil).instantiateViewController(withIdentifier: "footballVideoPlayer") as! FootballVideoViewController
        vc.videoLink = footballs[indexPath.row].videoLink
        vc.navigationTitle = footballs[indexPath.row].videoName
        vc.index = indexPath.row
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
extension FootballViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return}
        if text.isEmpty{
            fetchedFootball.fetchFootball { [weak self] football in
                self?.footballs = football.football
            }
        }else{
            self.footballs = self.footballs.filter{$0.videoName.lowercased().contains(text.lowercased())}
            self.tableView.reloadData()
        }
    }
    
    
}
