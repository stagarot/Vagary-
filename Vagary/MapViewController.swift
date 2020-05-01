//
//  MapViewController.swift
//  Computer Science IA
//
//  Created by Sara Tagarot on 3/4/18.
//  Copyright © 2018 Unknown. All rights reserved.
//

import UIKit
import MapKit //needed to display the map

class MapViewController: UIViewController {

    //links the mapview to the code as an outlet
    @IBOutlet weak var Map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sets the location of the user to the Angel attractions
        let centerLocation = CLLocationCoordinate2DMake(19.4351668, -99.204074) //coordinates for attraction El Angel
        
        //sets how big/small the map is going to look
        let mapSpan = MKCoordinateSpanMake(0.1, 0.1)
        
        //Adds a pin to all the locations
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude:19.4351668, longitude: -99.204074)
 
        Map.addAnnotation(annotation)
        
        
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = CLLocationCoordinate2D(latitude:19.355143, longitude: -99.162525)
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = CLLocationCoordinate2D(latitude:19.432602, longitude: -99.133205)
        let annotation3 = MKPointAnnotation()
        annotation3.coordinate = CLLocationCoordinate2D(latitude:19.357717, longitude: -99.159597)
        let annotation4 = MKPointAnnotation()
        annotation4.coordinate = CLLocationCoordinate2D(latitude:19.436180, longitude: -99.146956)
        let annotation5 = MKPointAnnotation()
        annotation5.coordinate = CLLocationCoordinate2D(latitude:19.692274, longitude: -98.843522)
        let annotation6 = MKPointAnnotation()
        annotation6.coordinate = CLLocationCoordinate2D(latitude:19.440693, longitude: 99.204700)
        let annotation7 = MKPointAnnotation()
        annotation7.coordinate = CLLocationCoordinate2D(latitude:19.434329, longitude: -99.140163)
        let annotation8 = MKPointAnnotation()
        annotation8.coordinate = CLLocationCoordinate2D(latitude:19.435200, longitude: -99.141200)
        let annotation9 = MKPointAnnotation()
        annotation9.coordinate = CLLocationCoordinate2D(latitude:19.420440, longitude: -99.181935)
        let annotation10 = MKPointAnnotation()
        annotation10.coordinate = CLLocationCoordinate2D(latitude:19.426003, longitude: -99.186279)
        let annotation11 = MKPointAnnotation()
        annotation11.coordinate = CLLocationCoordinate2D(latitude:19.434604, longitude: -99.131881)
        
        Map.addAnnotation(annotation1)
        Map.addAnnotation(annotation2)
        Map.addAnnotation(annotation3)
        Map.addAnnotation(annotation4)
        Map.addAnnotation(annotation5)
        Map.addAnnotation(annotation6)
        Map.addAnnotation(annotation7)
        Map.addAnnotation(annotation8)
        Map.addAnnotation(annotation9)
        Map.addAnnotation(annotation10)
        Map.addAnnotation(annotation11)
        

        //sets the region the map is going to cover
        let mapRegion = MKCoordinateRegionMake(centerLocation, mapSpan)
        self.Map.setRegion(mapRegion, animated: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
