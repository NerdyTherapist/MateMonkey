//
//  ViewController.swift
//  MateMonkey
//
//  Created by Peter on 29.01.17.
//  Copyright © 2017 Jurassic Turtle. All rights reserved.
//

import UIKit
import MapKit

class MateMapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager: CLLocationManager!
    var initialLocationSet = false {
        didSet {
            // if it is now true, lets request surrounding dealers!
            fetcher.queryForMapRect(self.mapView.visibleMapRect)
        }
    }
    
    let fetcher = MMDealerFetcher()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fetcher.delegate = self
        
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func centerUserLocation(_ sender: UIButton) {
        if let currentLocation = locationManager.location {
            centerMapOnLocation(currentLocation, animated: true)
        }
    }
    
    @IBAction func searchCurrentMapArea(_ sender: UIButton) {
        fetcher.queryForMapRect(self.mapView.visibleMapRect)
    }
    
    func centerMapOnLocation(_ location: CLLocation, animated: Bool) {
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.mapView.setRegion(region, animated: animated)
    }
    
}

extension MateMapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if initialLocationSet == false {
            if let lastLocation = locations.last {
                centerMapOnLocation(lastLocation, animated: false)
                initialLocationSet = true
            }
        }
    }
}

extension MateMapViewController: MMDealerFetcherDelegate {
    func queryCompleted(sender: MMDealerFetcher) {
        // call a method to populate the map with the fetcher's results
        print("There are \(sender.results.count) dealers on the map.")
        // TODO: if the results-Array from the fetcher is empty, we should display a message telling the user (popup, "toast", or similar)
    }
}
