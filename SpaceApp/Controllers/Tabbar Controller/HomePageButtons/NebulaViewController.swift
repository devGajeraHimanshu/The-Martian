//
//  ARViewViewController.swift
//  SpaceApp
//  Himanshu Gajera
//
//  Created by R&W
//
import UIKit

class NebulaViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var nebulaDataTableView: UITableView!
    @IBOutlet weak var starAnimation: UIImageView!
    
    //MARK: - Variables
    var arrOfNebulaData: [NebulaData] = [
        NebulaData(nebulaImage: UIImage(named: "1PlanetaryNebula")!, nebulaName: "Planetary Nebula"),
        NebulaData(nebulaImage: UIImage(named: "2HorseHeadNebula")!, nebulaName: "Horsehead Nebula"),
        NebulaData(nebulaImage: UIImage(named: "3SupernovaRemnant")!, nebulaName: "Supernova Remnant "),
        NebulaData(nebulaImage: UIImage(named: "4OrionNebula")!, nebulaName: "Orion Nebula"),
        NebulaData(nebulaImage: UIImage(named: "5NGC6357")!, nebulaName: "NGC 6357"),
        NebulaData(nebulaImage: UIImage(named: "6TarantulaNebula")!, nebulaName: "Tarantula Nebula"),
        NebulaData(nebulaImage: UIImage(named: "7HomunculusNebula")!, nebulaName: "Homunculus Nebula")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nebulaDataTableView.register(UINib(nibName: "NebulaNewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NebulaNewsTableViewCell")
        gifImage()
    }
    
    //MARK: - Gif Load in Image View
    func gifImage() {
        let jeremyGif = UIImage.gifImageWithName("starGif")
        starAnimation.image = jeremyGif
    }
    
    @IBAction func backToHomePage(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

extension NebulaViewController: UITableViewDelegate, UITableViewDataSource {
    //This will return number of Sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrOfNebulaData.count
    }
    
    //This func will return the array of count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //This will print the data in table view cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: NebulaNewsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "NebulaNewsTableViewCell", for: indexPath) as! NebulaNewsTableViewCell
        let nebulaArray = arrOfNebulaData[indexPath.section]
        cell.nebulaImages.image = nebulaArray.nebulaImage
        cell.nebulaNames.text = nebulaArray.nebulaName
        
        cell.nebulaImages.layer.cornerRadius = 15
        cell.nebulaImages.layer.masksToBounds = true
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let arrSpaceNews = arrOfNebulaData[indexPath.section]
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let transferDataToDetailsController = storyBoard.instantiateViewController(withIdentifier: "NebulaSingleInfoViewController") as! NebulaSingleInfoViewController
        starAnimation.stopAnimating()
        
        for i in 0..<arrOfNebulaData.count {
            if indexPath.section == i {
                DispatchQueue.main.async {
                    transferDataToDetailsController.selectedName.text = arrSpaceNews.nebulaName
                    transferDataToDetailsController.nebulaImages.image = self.arrOfNebulaData[indexPath.row].nebulaImage
                }
            }
        }
        
        navigationController?.pushViewController(transferDataToDetailsController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 198
    }
}
