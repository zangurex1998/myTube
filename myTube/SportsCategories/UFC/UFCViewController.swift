//
//  UFCViewController.swift
//  myTube
//
//  Created by technomix on 17.03.23.
//

import UIKit

class UFCViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
  
    var fetchedUFC: UFCAPIManagerProtocol = UFCAPIManager()


    var fetching: [Ufc] = []{
        didSet{
            self.tableView.reloadData()
        }
    }
    var searchController = UISearchController()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        fetchedUFC.fetching { [weak self] ufcInfo in
            self?.fetching = ufcInfo.ufcGeorgia
        }
       
       
        setUpSearch()
        
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar(largeTitleColor: .gray, backgoundColor: .systemYellow, tintColor: .gray, title: "UFC", preferredLargeTitle: true)
    }
    private func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "UFCTableViewCell", bundle: nil), forCellReuseIdentifier: "UFCTableViewCell")
    }
    

    
 
    private func setUpSearch(){
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
            }
    
    
    deinit {
        print("UFC Is Deinited")
    }
   

}
extension UFCViewController: UITableViewDataSource,UITableViewDelegate,UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {return}
        if text.isEmpty{
            fetchedUFC.fetching { [weak self] ufcInfo in
                self?.fetching = ufcInfo.ufcGeorgia
            }
        }else{
            self.fetching = self.fetching.filter{$0.videoName.lowercased().contains(text.lowercased())}
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fetching.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UFCTableViewCell", for: indexPath) as! UFCTableViewCell
        cell.configure(with: fetching[indexPath.row])
        return  cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "FootballVideo", bundle: nil).instantiateViewController(withIdentifier: "footballVideoPlayer") as! FootballVideoViewController
        vc.videoLink = fetching[indexPath.row].videolink
        vc.navigationTitle = fetching[indexPath.row].videoName
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}
