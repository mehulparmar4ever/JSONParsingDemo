//
//  DetailViewController.swift
//  JSONDemo
//
//  Created by mehulmac on 18/08/17.
//  Copyright © 2017 mehulmac. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailBigImage: UIImageView!

    var detailItem : PhotosModel!
    
    func configureView() {
        // Update the user interface for the detail item.

        if let imgUrl = detailItem.url {
            if let imgBig = detailBigImage {
                imgBig.setImage(fromStrUrl: imgUrl, setPlaceholder: .CameraBg, usingActivityIndicatorStyle: .gray)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

