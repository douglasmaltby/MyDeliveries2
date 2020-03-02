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
    var detailPanel: FUIMapDetailPanel! // show detail about the annotation
    
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
        
        setupDetailPanel()
        
        // Do any additional setup after loading the view.
    }
    
    // Ensures that the detail panel is present whenever the map view appears.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        detailPanel.presentContainer()
    }

    private func setupDetailPanel() {
        mapView.delegate = self
        detailPanel = FUIMapDetailPanel(parentViewController: self, mapView: mapView)

        // Configure the table view in the detail panel to use a custom cell type for map details.
        detailPanel.content.tableView.register(FUIMapDetailTagObjectTableViewCell.self, forCellReuseIdentifier: FUIMapDetailTagObjectTableViewCell.reuseIdentifier)

        // This view controller will supply the data for the detail panel's table view.
        detailPanel.content.tableView.dataSource = self
        detailPanel.content.tableView.delegate = self
        detailPanel.content.headlineText = "Tracking #: 12345678976543213"
        detailPanel.isSearchEnabled = false
    }
    
    // Dismisses the detail panel whenever the map view disappears.
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presentedViewController?.dismiss(animated: false, completion: nil)
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

extension TrackingMapViewController: UITableViewDataSource {

    // The detail view will only show one row.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    // Returns a custom cell populated with sample data.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let detailCell = tableView.dequeueReusableCell(withIdentifier: FUIMapDetailTagObjectTableViewCell.reuseIdentifier, for: indexPath) as! FUIMapDetailTagObjectTableViewCell

        detailCell.tags = ["Germany", "Europe"]
        detailCell.subheadlineText = "Dietmar-Hopp-Allee 16"
        detailCell.footnoteText = "Germany"
        detailCell.substatusText = "Arrival at 09:41"

        // Fiori includes a library of icons, such as a clock indicator.
        detailCell.statusImage = FUIIconLibrary.indicator.clock.withRenderingMode(.alwaysTemplate)

        return detailCell
    }
}

extension TrackingMapViewController: UITableViewDelegate {
    // You can add your own code here to handle detail view events.
}

extension TrackingMapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        detailPanel.pushChildViewController()
    }

    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        detailPanel.popChildViewController()
    }
}
