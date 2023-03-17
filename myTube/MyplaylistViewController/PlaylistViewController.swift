//
//  PlaylistViewController.swift
//  myTube
//
//  Created by technomix on 16.03.23.
//

import UIKit
import CoreData
class PlaylistViewController: UIViewController {
    
    //MARK: - Outlets
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var fetchedPlaylist: [Playlist] = []{
        didSet{
            self.tableVIew.reloadData()
        }
    }
    @IBOutlet weak var emptyView: UIView!
    
    @IBOutlet weak var tableVIew: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar(largeTitleColor: .gray, backgoundColor: .systemYellow, tintColor: .gray, title: "My Playlist", preferredLargeTitle: true)
        setUpTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    private func setUpTableView(){
        tableVIew.dataSource = self
        tableVIew.register(UINib(nibName: "PlaylistTableViewCell", bundle: nil), forCellReuseIdentifier: "PlaylistTableViewCell")
    }
    private func fetchData(){
        let request = NSFetchRequest<Playlist>(entityName: "Playlist")
        
        do{
            fetchedPlaylist = try context.fetch(request)
        }
        catch{
            print(error.localizedDescription)
        }
    }

}
extension PlaylistViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fetchedPlaylist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaylistTableViewCell", for: indexPath) as! PlaylistTableViewCell
        cell.configure(with: fetchedPlaylist[indexPath.row])
        return cell
    }
    
    
}
