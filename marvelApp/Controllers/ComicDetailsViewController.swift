//
//  ComicDetailsViewController.swift
//  marvelApp
//
//  Created by idaira aleman quintana on 20/3/22.
//

import UIKit

class ComicDetailsViewController: UIViewController,UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var comicDetailsTable: UITableView!
    

    var comicDetails:ComicsItem?
    
    let idcellDetails = "CellDetails"
    
   
    
    init(comicDetails:ComicsItem){
        self.comicDetails = comicDetails
        super.init(nibName: "ComicDetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Details"
        comicDetailsTable.dataSource = self
        comicDetailsTable.delegate = self
        
        let cellDetails = UINib(nibName: "CellComicDetails", bundle: nil)
        self.comicDetailsTable.register(cellDetails, forCellReuseIdentifier: idcellDetails)
        self.comicDetailsTable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 780
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = comicDetailsTable.dequeueReusableCell(withIdentifier: idcellDetails, for: indexPath)
        
        
        if let cellComicDetails = cell as? CellComicDetails {
            var path :String = (comicDetails?.thumbnail.path ?? "")
            var ext :String = (comicDetails?.thumbnail.extension ?? "")
            var urlImage = URL(string: path + "." + ext)
            do{
                let data = try Data (contentsOf: urlImage!)
            cellComicDetails.imageDetails.image = UIImage(data: data)
            }catch let error as NSError{
                print(error)
            }
            
            cellComicDetails.titleDetails.text = comicDetails?.title
            cellComicDetails.informationDetails.text = comicDetails?.description
        }
        return cell
    }

}
