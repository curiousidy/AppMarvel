//
//  HomePageViewController.swift
//  marvelApp
//
//  Created by idaira aleman quintana on 19/3/22.
//

import UIKit

class HomePageViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var comicTable: UITableView!
    
    let idCelda = "cellHomePage"
    
    let netWorkLibrary:NetworkLibrary = NetworkLibrary()
    
    var comicsCollection: [ComicsItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        netWorkLibrary.getComics(){
            response in
            self.comicsCollection = response
            
            DispatchQueue.main.async {
                self.comicTable.reloadData()
            }
        }
        comicTable.dataSource = self
        comicTable.delegate = self
        
        let cellHomePage = UINib(nibName: "CellHomePageTableViewCell", bundle: nil)
        self.comicTable.register(cellHomePage, forCellReuseIdentifier: idCelda)
        self.comicTable.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 56, right: 0)
        self.comicTable.reloadData()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comicsCollection.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 164
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = comicTable.dequeueReusableCell(withIdentifier: idCelda, for: indexPath)
        
        if let cellHome = cell as? CellHomePageTableViewCell {
            
            netWorkLibrary.getImage(path: comicsCollection[indexPath.row].thumbnail.path, type: comicsCollection[indexPath.row].thumbnail.extension){
                    response in
                    
                    DispatchQueue.main.async {
                        cellHome.homeImage.image = response
                    }
                }
            cellHome.title.text = comicsCollection[indexPath.row].title
            cellHome.information.text = comicsCollection[indexPath.row].description
        }
        
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = ComicDetailsViewController(comicDetails:comicsCollection[indexPath.row] ?? ComicsItem(id: 0, title: "",description: "",thumbnail: Thumbnail(path: "", extension: "")))
       self.navigationController?.pushViewController(controller, animated: true)
       comicTable.deselectRow(at: indexPath, animated: true)
    }
    
}





