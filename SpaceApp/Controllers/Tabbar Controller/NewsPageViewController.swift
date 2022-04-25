//
//  ARViewViewController.swift
//  SpaceApp
//  Himanshu Gajera
//
//  Created by R&W
//

import UIKit

class NewsPageViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var spaceNewsTableView: UITableView!
    
    @IBOutlet weak var starAnimation: UIImageView!
    //MARK: - Variables
    var arrayOfSpaceNews: [AstronomicalNews] = [
        AstronomicalNews(newsImage: #imageLiteral(resourceName: "1JamesWebbTelescope"), newsInformation: "James Webb Space Telescope gets ready to gaze deep into the universe", spaceNewsInfo: """
 Carrying out the James Webb Space Telescope’s (JWST) ground-breaking mission required powerful     technological innovations in optics, detectors, mirrors and a multitude of other areas.
    
 JWST's unprecedented scientific power is partly a function of the size and extreme sensitivity of its primary mirror, which collects the images from space. The gold-plated mirror is 21 feet in diameter, giving a collecting area of 273 square feet.
 """),
        
        AstronomicalNews(newsImage: #imageLiteral(resourceName: "2cubesats"), newsInformation: "Tiny satellites are changing the way we explore our planet and beyond", spaceNewsInfo: """
 This month, the SpaceX Crew Dragon spacecraft will make the first fully-private, crewed flight to the International Space Station. The going price for a seat is US$55 million. The ticket comes with an eight-day stay on the space station, including room and board – and unrivalled views.

 Virgin Galactic and Blue Origin offer cheaper alternatives, which will fly you to the edge of space for a mere US$250,000-500,000. But the flights only last between ten and 15 minutes, barely enough time to enjoy an in-flight snack.
"""),
        
        AstronomicalNews(newsImage: #imageLiteral(resourceName: "4SpaceShip"), newsInformation: "Virgin Galactic's SpaceShip III, a more durable spaceplane", spaceNewsInfo: """
 In just a few short days on July 11, billionaire founder of Virgin Galactic, Richard Branson, aims to officially become Astronaut 001 when he flies to the edge of space aboard the company's FAA-licensed spaceplane, VSS Unity.

 Though considered a test flight, this mission will serve to globally showcase what the astronaut experience will be like when the company begins flying tourists to space as early as 2022.
"""),
        
        AstronomicalNews(newsImage: #imageLiteral(resourceName: "5LunarImage"), newsInformation: "Solar-powered Moon rovers will help scientists seek lunar ice", spaceNewsInfo: """
 Scientists have long tested solar energy in space, but it may soon arrive on the Moon — in the form of rovers equipped with solar panels.

 On unmanned moon missions, these petite robotic vehicles will test the limits of how humans power their explorations, navigate the moon’s surface, and create potential human habitats far from home.
"""),
        
        AstronomicalNews(newsImage: #imageLiteral(resourceName: "6HubbleTelescope"), newsInformation: "Hubble waylaid by computer fault", spaceNewsInfo: """
 The good news is that the core scientific instruments and the telescope itself remain in good health. And there are on-board backups for the systems suspected to be at fault, which are part of an assemblage of components called the Science Instrument Command and Data Handling (SI C&DH) unit.

 But so far, Hubble’s team hasn’t identified which piece of hardware is at the root of the failure. And turning on those backups will be an intricate procedure that is risker than some of the steps tried so far.
"""),
        
        AstronomicalNews(newsImage: #imageLiteral(resourceName: "7SpaceX"), newsInformation: "How do spaceX's Starlink satellites actually work?", spaceNewsInfo: """
 Witnessing a conga line of dozens of bright satellites marching through the night sky has surprised — and occasionally unsettled — many around the world in recent years.

 And as much as the sight of SpaceX's Starlink satellites passing overhead might mystify the unacquainted, exactly how they work remains a riddle to many of those who already know about the ambitious project.
"""),
        
        AstronomicalNews(newsImage: #imageLiteral(resourceName: "3Earth"), newsInformation: "Earth Is spinning faster now than it was 50 years ago", spaceNewsInfo: """
 Our solar system formed about 4.5 billion years ago, when a dense cloud of interstellar dust and gas collapsed in on itself and began to spin.

 There are vestiges of this original movement in our planet’s current rotation, thanks to angular momentum — essentially, “the tendency of the body that's rotating, to carry on rotating until something actively tries to stop it,” explains Peter Whibberley, a senior research scientist at the UK’s National Physical Laboratory.
"""),
        
        AstronomicalNews(newsImage: #imageLiteral(resourceName: "8SkyThisMonth"), newsInformation: "The Sky This Week: April is Global Astronomy Month!", spaceNewsInfo: """
 The month of April begins with the Moon in its New phase, which occurs at 2:24 A.M. EDT.
                         
 That makes this evening a great opportunity to look for the elusive zodiacal light, which is generated by sunlight scattering off tiny dust grains in the inner solar system. Astronomers think these grains were scattered through the solar system by the repeated passage of comets, although more recently, martian dust storms have been implicated as well.
""")
]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spaceNewsTableView.register(UINib(nibName: "ConstellationNewsTableViewCell", bundle: nil), forCellReuseIdentifier: "ConstellationNewsTableViewCell")
        navigationController?.isNavigationBarHidden = true
        
        spaceNewsTableView.backgroundColor = .clear
        gifImage()
    }
    
    //MARK: - Gif Load in Image View
    func gifImage() {
        let jeremyGif = UIImage.gifImageWithName("starGif")
        starAnimation.image = jeremyGif
    }
}

extension NewsPageViewController: UITableViewDelegate, UITableViewDataSource {
    //This will return number of Sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayOfSpaceNews.count
    }
    
    //This func will return the array of count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    //This will print the data in table view cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SpaceNewsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ConstellationNewsTableViewCell", for: indexPath) as! SpaceNewsTableViewCell
        let array = arrayOfSpaceNews[indexPath.section]
        cell.newsTitle.text = array.newsInformation
        cell.newsImage.image = array.newsImage
        
        cell.layer.cornerRadius = 15
        cell.layer.masksToBounds = true
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let arrSpaceNews = arrayOfSpaceNews[indexPath.section]
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let transferDataToDetailsController = storyBoard.instantiateViewController(withIdentifier: "DisplayDetailsNewsViewController") as! DisplayDetailsNewsViewController
        starAnimation.stopAnimating()
        for i in 0..<arrayOfSpaceNews.count {
            if indexPath.section == i {
                DispatchQueue.main.async {
                    transferDataToDetailsController.newsImage.image = self.arrayOfSpaceNews[i].newsImage
                    transferDataToDetailsController.headingData.text = arrSpaceNews.newsInformation
                    transferDataToDetailsController.newsInformation.text = arrSpaceNews.spaceNewsInfo
                }
            }
        }
        
        navigationController?.pushViewController(transferDataToDetailsController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 198
    }
}
