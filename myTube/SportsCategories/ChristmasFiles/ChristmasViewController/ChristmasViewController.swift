//
//  ChristmasViewController.swift
//  myTube
//
//  Created by technomix on 17.03.23.
//

import UIKit

class ChristmasViewController: UIViewController {
    
    //MARK: - Outlets
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var christmas: ChristmasAPimanagerProtocol = ChristmasAPIManager()
    var fetchedChristmas: [Christmas] = []{
        didSet {
            self.tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar(largeTitleColor: .gray, backgoundColor: .systemYellow, tintColor: .gray, title: "Best Of Christmas", preferredLargeTitle: false)
        christmas.fetchChristmas { [weak self] bestOf in
            self?.fetchedChristmas = bestOf.NBAChristmas
        }
        setUpTableView()
        
    }
    
    private func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ChristmasTableViewCell", bundle: nil), forCellReuseIdentifier: "ChristmasTableViewCell")
    }

}

extension ChristmasViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fetchedChristmas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChristmasTableViewCell", for: indexPath) as! ChristmasTableViewCell
        cell.configure(with: fetchedChristmas[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "FootballVideo", bundle: nil).instantiateViewController(withIdentifier: "footballVideoPlayer") as! FootballVideoViewController
        vc.videoLink = fetchedChristmas[indexPath.row].videolink
        vc.navigationTitle = fetchedChristmas[indexPath.row].videoName
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
