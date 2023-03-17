//
//  BestOfViewController.swift
//  myTube
//
//  Created by technomix on 17.03.23.
//

import UIKit

class BestOfViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var best: bestOfAPIManagerProtocol = bestOfAPiManager()
    
    var fetchedBest: [BestOf] = [] {
        didSet{
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        best.fetch { [weak self] fetchingBest in
            self?.fetchedBest = fetchingBest.bestOfNBA
        }
        configureNavigationBar(largeTitleColor: .gray, backgoundColor: .systemYellow, tintColor: .gray, title: "Best Of 2022-23", preferredLargeTitle: false)
    }
    
    private func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "BestOfTableViewCell", bundle: nil), forCellReuseIdentifier: "BestOfTableViewCell")
    }
    
    deinit {
        print("Page Deinited")
    }

    

}

extension BestOfViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fetchedBest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BestOfTableViewCell", for: indexPath) as! BestOfTableViewCell
        cell.configure(with: fetchedBest[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "FootballVideo", bundle: nil).instantiateViewController(withIdentifier: "footballVideoPlayer") as! FootballVideoViewController
        vc.videoLink = fetchedBest[indexPath.row].videolink
        vc.navigationTitle = fetchedBest[indexPath.row].videoName
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
