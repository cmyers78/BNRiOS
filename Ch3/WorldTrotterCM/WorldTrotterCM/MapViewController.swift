//
//  MapViewController.swift
//  WorldTrotterCM
//
//  Created by Christopher Myers on 9/7/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

import UIKit
import MapKit

class MapViewController : UIViewController {
    
    var mapView : MKMapView!
    
    override func loadView() {
        mapView = MKMapView()
        
        view = mapView
        
        // creates a segmented control to choose map types
        let segmentControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        // segment control's background color
        segmentControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        // defaults to Standard map type
        segmentControl.selectedSegmentIndex = 0
        
        // set to false so as not to mess up constraints
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        
        segmentControl.addTarget(self, action: #selector(self.mapTypeChanged(_:)), forControlEvents: .ValueChanged)
        
        // adding segment control to the view screen
        view.addSubview(segmentControl)
        
        // MARK: Creating and setting anchors
        
        // creates constraints
        let topConstraint = segmentControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
//        let leadingConstraint = segmentControl.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor)
//        let trailingConstraint = segmentControl.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor)
        
        // creates margins instead of constraints
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let trailingConstraint = segmentControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        // activates constraints
        
        topConstraint.active = true
        leadingConstraint.active = true
        trailingConstraint.active = true
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func mapTypeChanged(segControl : UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .Standard
        case 1:
            mapView.mapType = .Hybrid
        case 2:
            mapView.mapType = .Satellite
        default:
            break
        }
    }
}
