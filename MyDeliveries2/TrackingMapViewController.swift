//
//  TrackingMapViewController.swift
//  MyDeliveries2
//
//  Created by Douglas Maltby on 3/1/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import UIKit
import MapKit
import SAPFiori

class TrackingMapViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!

    // Set static location to be displayed on the map.
    // FIXME: implement with real dynamic OData entities
    
    let location = CLLocationCoordinate2D(latitude: 49.293843, longitude: 8.641369)
    let visibleRegionMeters = 1_000_000.0
    
    var annotation: MKPointAnnotation!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize the annotation with the coordinate.
        annotation = MKPointAnnotation()
        annotation.coordinate = location

        // Set a title for the annotation.
        annotation.title = "Package 1"

        // Add the annotation to the map view.
        mapView.addAnnotation(annotation)
        
        // Map view must be told to use the custom marker to display the annotations
        mapView.register(FioriMarker.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        // Center the map.
        let coordinateRegion = MKCoordinateRegion(center: location, latitudinalMeters: visibleRegionMeters, longitudinalMeters: visibleRegionMeters)
        mapView.setRegion(coordinateRegion, animated: false)
        
        // Do any additional setup after loading the view.
    }
    
    private class FioriMarker: FUIMarkerAnnotationView {

        // Override the annotation property to customize it whenever it is set.
        override var annotation: MKAnnotation? {
            willSet {
                markerTintColor = .preferredFioriColor(forStyle: .map1)
                glyphImage = FUIIconLibrary.map.marker.venue.withRenderingMode(.alwaysTemplate)
                displayPriority = .defaultHigh
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
