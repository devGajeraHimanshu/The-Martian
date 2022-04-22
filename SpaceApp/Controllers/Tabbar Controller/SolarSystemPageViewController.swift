//
//  ARViewViewController.swift
//  SpaceApp
//  Himanshu Gajera
//
//  Created by R&W
//
import UIKit

class SolarSystemPageViewController: UIViewController {

    //MARK: - The Array of Displaying the Array of Planet
    var arrayOfLivePlanets: [PlanetLiveScroll] = [
        PlanetLiveScroll(planetName: "Mercury", planetImage: UIImage(named: "2Mercury")!, planetInfo: "202.13 million km"),
        PlanetLiveScroll(planetName: "Venus", planetImage: UIImage(named: "3Venus")!, planetInfo: "111.72 million km"),
        PlanetLiveScroll(planetName: "Earth", planetImage: UIImage(named: "4Earth")!, planetInfo: "0.01581 light years"),
        PlanetLiveScroll(planetName: "Mars", planetImage: UIImage(named: "5Mars")!, planetInfo: "273.71 million km"),
        PlanetLiveScroll(planetName: "Jupiter", planetImage: UIImage(named: "6Jupiter")!, planetInfo: "885.42 million km"),
        PlanetLiveScroll(planetName: "Saturn", planetImage: UIImage(named: "7Saturn")!, planetInfo: "1.5774 billion km"),
        PlanetLiveScroll(planetName: "Uranus", planetImage: UIImage(named: "8Uranus")!, planetInfo: "3.0701 billion km"),
        PlanetLiveScroll(planetName: "Neptune", planetImage: UIImage(named: "9Neptune")!, planetInfo: "4.6185 billion km")
    ]
    
    //MARK: - IBOutlets
    @IBOutlet weak var skyLiveTableView: UITableView!
    @IBOutlet weak var starAnimation: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        skyLiveTableView.register(UINib(nibName: "SolarSystemLiveTableViewCell", bundle: nil), forCellReuseIdentifier: "SolarSystemLiveTableViewCell")
        navigationController?.isNavigationBarHidden = true
        skyLiveTableView.backgroundColor = .clear
        gifImage()
    }
    
    //MARK: - Gif Load in Image View
    func gifImage() {
        let jeremyGif = UIImage.gifImageWithName("starGif")
        starAnimation.image = jeremyGif
    }
}

extension SolarSystemPageViewController: UITableViewDelegate, UITableViewDataSource {
    //This will return number of Sections
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    //This func will return the array of count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayOfLivePlanets.count
    }
    
    //This will print the data in table view cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SolarSystemLiveTableViewCell = tableView.dequeueReusableCell(withIdentifier: "SolarSystemLiveTableViewCell", for: indexPath) as! SolarSystemLiveTableViewCell
        let array = arrayOfLivePlanets[indexPath.row]
        cell.planetNames.text = array.planetName
        cell.planetImages.image = array.planetImage
        cell.lightYearsData.text = array.planetInfo
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animate(withDuration: 1) {
            cell.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
