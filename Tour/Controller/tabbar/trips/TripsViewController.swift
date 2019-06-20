//
//  TripsViewController.swift
//  Tour
//
//  Created by nguyen.thi.huec on 6/20/19.
//  Copyright © 2019 nguyen.van.bac. All rights reserved.
//

import UIKit
import Kingfisher

class TripsViewController: UIViewController {
    var tripDetails = [TripDetail]()
    
    @IBOutlet weak var imageTrip: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        loadData()
    }
    
    func initView(){
        let imageURL = URL(string: "http://divui.com/blog/wp-content/uploads/2017/01/hanoi-attractions.jpg")
        imageTrip.kf.setImage(
            with: imageURL,
            placeholder: UIImage(named: "image_default"),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
    
    private func loadData(){
        guard let tripDetail1 = TripDetail(labelTitle: "Người tạo chuyến đi", labelInfo: "Nguyễn Thị Huế C") else{
            fatalError("Unable to instantiate tripDetail1")
        }
        guard let tripDetail2 = TripDetail(labelTitle: "Chi phí dự kiến", labelInfo: "900.000 VND") else{
            fatalError("Unable to instantiate tripDetail2")
        }
        guard let tripDetail3 = TripDetail(labelTitle: "Chi phí thực tế", labelInfo: "1.000.000 VND") else{
            fatalError("Unable to instantiate tripDetail3")
        }
        guard  let tripDetail4 = TripDetail(labelTitle: "Phương tiện", labelInfo: "Xe máy, xe đạp, ô tô") else{
            fatalError("Unable to instantiate tripDetail4")
        }
        guard  let tripDetail5 = TripDetail(labelTitle: "Thành viên", labelInfo: "10 người") else{
            fatalError("Unable to instantiate tripDetail5")
        }
        guard let tripDetail6 = TripDetail(labelTitle: "Trạng thái chuyến đi", labelInfo: "Công khai") else{
            fatalError("Unable to instantiate tripDetail6")
        }
        tripDetails += [tripDetail1, tripDetail2, tripDetail3, tripDetail4, tripDetail5, tripDetail6]
    }
    
}

extension TripsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripDetails.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "DetailTripTableViewCell"
        guard let cell =
            tableView.dequeueReusableCell(withIdentifier:
                cellIdentifier, for: indexPath) as? DetailTripTableViewCell
            else {
                fatalError("The dequeued cell is not an instance of DetailTripTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let tripDetail = tripDetails[indexPath.row]
        
        cell.labelTitle.text = tripDetail.labelTitle
        cell.labelInfo.text = tripDetail.labelInfo
        
        return cell
    }
}
