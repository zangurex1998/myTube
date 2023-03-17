//
//  FootballVideoViewController.swift
//  myTube
//
//  Created by technomix on 16.03.23.
//

import UIKit
import youtube_ios_player_helper
import CoreData
class FootballVideoViewController: UIViewController {
    
    
    @IBOutlet weak var videoPlayer: YTPlayerView!
    @IBOutlet weak var headerText: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var addToPlaylistButton: UIButton!
    var index: Int?
    var videoLink: String?
    var navigationTitle: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        addToPlaylistButton.layer.cornerRadius = 12
        headerText.text = navigationTitle
        videoPlayer.load(withVideoId: videoLink ?? "")
        videoPlayer.playVideo()
        if #available(iOS 13.0, *) {
            configureNavigationBar(largeTitleColor: .gray, backgoundColor: .systemBackground, tintColor: .gray, title: navigationTitle ?? "", preferredLargeTitle: false)
        } else {
            // Fallback on earlier versions
        }
        setUpButtons()
        videoPlayer.layer.masksToBounds = true
        videoPlayer.layer.cornerRadius = 15
    }
    
    private func setUpButtons(){
        addToPlaylistButton.layer.cornerRadius = 12
        likeButton.layer.cornerRadius = 12
    }
    
    deinit {
        print("The VideoPlayer Deinited")
    }
    
    
    
    //MARK: - Actions
    
    @IBAction func didTapLikeButton(_ sender: Any) {
        likeButton.tintColor = .red
        if #available(iOS 13.0, *) {
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            // Fallback on earlier versions
        }
        
        saveData()
    }
    
    
    @IBAction func didTapAddToPlaylist(_ sender: Any) {
        
        if #available(iOS 13.0, *) {
            addToPlaylistButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            
        } else {
            // Fallback on earlier versions
        }
        addToPlaylistButton.setTitle("Added To playlist", for: .normal)
        // addToPlaylistButton.backgroundColor = .green
        addToPlaylistButton.tintColor = .green
        saveInPlaylist()
    }
    
    
    private func saveData(){
        guard let appDelegate = (UIApplication.shared.delegate as? AppDelegate) else {return}
        let container = appDelegate.persistentContainer
        let context = container.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "Liked", in: context) else { return }
        let likedVideo = NSManagedObject(entity: entity, insertInto: context)
        
        likedVideo.setValue(videoLink, forKey: "link")
        
        do{
            try context.save()
            print("video saved!")
        }
        catch{
            print(error.localizedDescription)
        }
        
    }
    
    private func saveInPlaylist(){
        guard let appDelegate = (UIApplication.shared.delegate as? AppDelegate) else {return}
        let container = appDelegate.persistentContainer
        let context = container.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "Playlist", in: context) else { return }
        let playlistVideo = NSManagedObject(entity: entity, insertInto: context)
        
        playlistVideo.setValue(videoLink, forKey: "link")
        
        do{
            try context.save()
            print("saved in playlist")
        }
        catch{
            print(error.localizedDescription)
        }
        
    }
    
    
    
    
    
  
}
