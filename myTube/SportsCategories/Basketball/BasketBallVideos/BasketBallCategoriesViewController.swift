//
//  BasketBallCategoriesViewController.swift
//  myTube
//
//  Created by technomix on 17.03.23.
//

import UIKit

class BasketBallCategoriesViewController: UIViewController {
    
    //MARK: - Outlets
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var fetchingHiglights: [NBAHiglights] = [] {
        didSet{
            self.tableView.reloadData()
        }
    }
    var fetchingData: NBAhighlightsProtocol = NBAHighlight()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        fetchingData.fetchingHighlights { [weak self] fetchedData in
            self?.fetchingHiglights = fetchedData.NBAhiglights
        }
        
    }
    
    deinit {
        print("This Page is Deinited Too!!")
    }
    
    private func setUpTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "BasketballCategoriesTableViewCell", bundle: nil), forCellReuseIdentifier: "BasketballCategoriesTableViewCell")
    }

  

}

extension BasketBallCategoriesViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fetchingHiglights.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasketballCategoriesTableViewCell", for: indexPath) as! BasketballCategoriesTableViewCell
        cell.configure(with: fetchingHiglights[indexPath.row])
        return  cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "FootballVideo", bundle: nil).instantiateViewController(withIdentifier: "footballVideoPlayer") as! FootballVideoViewController
        vc.videoLink = fetchingHiglights[indexPath.row].videolink
        vc.navigationTitle = fetchingHiglights[indexPath.row].videoName
        navigationController?.pushViewController(vc, animated: true)
    
    }
    
    
}
