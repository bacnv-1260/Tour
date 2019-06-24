//
//  HomeViewController.swift
//  Tour
//
//  Created by Hoanglong on 6/17/19.
//  Copyright © 2019 nguyen.van.bac. All rights reserved.
//

import UIKit
import Firebase
import Kingfisher

class HomeViewController: UIViewController {
    var trips = [[Trip]]()
    var upCommingTrip = [Trip]()
    var wentTrip = [Trip]()
    let headerTitles = ["Chuyến đi sắp diễn ra", "Bạn đã đi!"]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveTrips()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    let ref = Database.database().reference()
    
    func retrieveTrips(){
        Trip.posts() { (posts) in
            for travel in posts {
                if let startDate = travel.startDate,
                    let endDate = travel.endDate {
                    if String.compareWithTheUpcommingDay(startString: startDate) {
                        self.upCommingTrip.append(travel)
                    } else if String.compareWithTookPlaceDay(startString: startDate, endString: endDate) {
                        self.wentTrip.append(travel)
                    }
                }
            }
            self.trips.append(self.upCommingTrip)
            self.trips.append(self.wentTrip)
            self.tableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return trips.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section < headerTitles.count ? headerTitles[section] : nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "TripTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TripTableViewCell  else {
            fatalError("The dequeued cell is not an instance of TripTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let trip = trips[indexPath.section][indexPath.row]
        cell.labelTrip.text = trip.labelTrip
        
//        let startDate = String.convertDate(date: trip.startDate!)
        let endDate = String.convertDate(dateString: trip.endDate)
        let startDate = String.convertDate(dateString: trip.startDate)
        cell.dateTrip.text = startDate + "->" + endDate
        
        let imageURL = URL(string: trip.imageTrip ?? "https://is3-ssl.mzstatic.com/image/thumb/Purple113/v4/94/42/e3/9442e3d3-fb21-4bd3-7b21-cbd4e10d965f/AppIcon-0-1x_U007emarketing-0-0-GLES2_U002c0-512MB-sRGB-0-0-0-85-220-0-0-0-6.png/246x0w.jpg")
        cell.imageTrip.kf.setImage(
            with: imageURL,
            placeholder: UIImage(named: "image_default"),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let homeStoryboard = UIStoryboard.init(name: "Home", bundle: nil)
        let homeViewController = homeStoryboard.instantiateViewController(withIdentifier: "TripsViewController") as! TripsViewController
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
}
