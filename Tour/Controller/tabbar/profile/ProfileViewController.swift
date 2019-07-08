//
//  ProfileViewController.swift
//  Tour
//
//  Created by nguyen.thi.huec on 6/20/19.
//  Copyright © 2019 nguyen.van.bac. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet var tableView: UITableView!
    private let headerTitles = ["Chuyến đi sắp diễn ra", "Bạn đã đi!"]
    private var trips = [[Trip]]()
    private var upCommingTrip = [Trip]()
    private var wentTrip = [Trip]()
    private let refreshControl = UIRefreshControl()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveTrips()
        initRefresh()
        tableView.tableFooterView = UIView()
        let unib = UINib.init(nibName: "HeaderTableViewCell", bundle: nil)
        tableView.register(unib, forCellReuseIdentifier: "HeaderTableViewCell")
    }
    
    private func initRefresh(){
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        refreshControl.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching Trip Data ...", attributes: nil)
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
    }
    
    @objc private func refreshData(_ sender: Any) {
        retrieveTrips()
    }
    
    func retrieveTrips(){
        Trip.posts() { (posts) in
            DispatchQueue.main.async {
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
                self.refreshControl.endRefreshing()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerTitles[section]
    }
 
    func numberOfSections(in tableView: UITableView) -> Int {
        return headerTitles.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell {
            if trips.count <= 0 {
                print("No items")
            } else{
                if trips[indexPath.section].count < 0 {
                    print("No items")
                }else{
                    cell.trips = trips[indexPath.section]
                }
            }
            cell.collectionView.reloadData()
            cell.navigation = navigationController!
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as! HeaderTableViewCell
        headerCell.titleHeader.text = headerTitles[section]
        return headerCell
    }
}
