//
//  TestimonialViewController.swift
//  DesignCodeAppAutoLayout
//
//  Created by Lisa Steele on 9/10/18.
//  Copyright © 2018 lisahsteele. All rights reserved.
//

import UIKit

class TestimonialViewController: UIViewController {
    
    @IBOutlet weak var testimonialCollectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        testimonialCollectionView.delegate = self
        testimonialCollectionView.dataSource = self
    }

   

}

extension TestimonialViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testimonials.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testimonialCell", for: indexPath) as! TestimonialCollectionViewCell
        let testimonial = testimonials[indexPath.row]
        cell.text.text = testimonial["text"]
        cell.name.text = testimonial["name"]
        cell.job.text = testimonial["job"]
        cell.avatar.image = UIImage(named: testimonial["avatar"]!)
        return cell
    }
}
