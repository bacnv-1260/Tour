//
//  TableViewCell.swift
//  Tour
//
//  Created by Hoanglong on 7/7/19.
//  Copyright © 2019 nguyen.van.bac. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    var navigation: UINavigationController = UINavigationController()

    var trips = [Trip]()
    
    var imageArray = [String] ()
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trips.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell: CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell
        {
            let trip = trips[indexPath.row]
            let imageURL = URL(string: trip.imageTrip ?? "https://is3-ssl.mzstatic.com/image/thumb/Purple113/v4/94/42/e3/9442e3d3-fb21-4bd3-7b21-cbd4e10d965f/AppIcon-0-1x_U007emarketing-0-0-GLES2_U002c0-512MB-sRGB-0-0-0-85-220-0-0-0-6.png/246x0w.jpg")
            cell.imageView.kf.setImage(
                with: imageURL,
                placeholder: UIImage(named: "image_default"),
                options: [
                    .scaleFactor(UIScreen.main.scale),
                    .transition(.fade(1)),
                    .cacheOriginalImage
                ])
            cell.nameTrip.text = trip.labelTrip
            let endDate = String.convertDate(dateString: trip.endDate)
            let startDate = String.convertDate(dateString: trip.startDate)
            cell.dateTrip.text = startDate + "->" + endDate
            return cell

        }
        return UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        let homeStoryboard = UIStoryboard.init(name: "Home", bundle: nil)
        let homeViewController = homeStoryboard.instantiateViewController(withIdentifier: "TripsViewController") as! TripsViewController
        navigation.pushViewController(homeViewController, animated: true)
        return true
    }
}
