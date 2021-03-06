//
//  MapViewController.swift
//  Login Start
//
//  Created by Spas Bilyarski on 15.11.18.
//  Copyright © 2018 FMI Practice. All rights reserved.
//

import UIKit
import MapKit

final class MapViewController: UIViewController {
    
    var locationModel: LocationModel?
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
        centerMapOnLocation(location: locationModel!)
    }
    
    func centerMapOnLocation(location: LocationModel) {
        let coordinateRegion = MKCoordinateRegion(center: location.initialLocation.coordinate, latitudinalMeters: location.regionRadius, longitudinalMeters: location.regionRadius)
        mapView.setRegion(coordinateRegion, animated: false)
    }
    
    // Задача 10: Завържете MKMapView-то от xib файла с mapView outlet-a от този файл.
    
    // Задача 10: Извикайте метода centerMapOnLocation(_:) с подаденият locationModel когато екранът се покаже и анимацията е завършена.

    
}
