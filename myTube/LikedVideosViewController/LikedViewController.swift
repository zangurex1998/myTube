//
//  LikedViewController.swift
//  myTube
//
//  Created by technomix on 16.03.23.
//

import UIKit
import CoreData

class LikedViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var emptyView: UIView!
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var likedVideos: [Liked] = []{
        didSet{
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableview()
        fetchData()
        tableView.isHidden = true
        handleEmptiness()
        configureNavigationBar(largeTitleColor: .gray, backgoundColor: .systemYellow, tintColor: .gray, title: "Liked Videos", preferredLargeTitle: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    private func setUpTableview(){
        tableView.dataSource = self
        tableView.register(UINib(nibName: "LikedTableViewCell", bundle: nil), forCellReuseIdentifier: "LikedTableViewCell")
    }
    
    private func handleEmptiness(){
        if likedVideos.count == 0 {
            tableView.isHidden = true
            
        }else{
            tableView.isHidden = false
        }
    }
    
    private func fetchData(){
        let request = NSFetchRequest<Liked>(entityName: "Liked")
        do{
            likedVideos = try context.fetch(request).reversed()
        }
        catch{
            print(error.localizedDescription)
        }
    }
  

}

extension LikedViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        likedVideos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "LikedTableViewCell", for: indexPath) as! LikedTableViewCell
        cell.configure(with: likedVideos[indexPath.row])
        return cell
    }
    
    
}
