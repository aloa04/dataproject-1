//
//  MapsRoutes.swift
//  Travis (iOS)
//
//  Created by Pablo Bottero on 1/2/22.
//

import SwiftUI
import MapKit

struct MapsRoutes: View {
    var body: some View {
        mapView()
    }
}

struct MapsRoutes_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct mapView : UIViewRepresentable {
    func makeCoordinator() -> mapView.Coordinator {
        return mapView.Coordinator()
        
    }
    
    func makeUIView(context: UIViewRepresentableContext<mapView>) -> MKMapView {
        
        let map = MKMapView()
        
        let sourceCoordinate = CLLocationCoordinate2D(latitude: 39.475532 , longitude: -0.397912)
        
        let destinationCoordinate = CLLocationCoordinate2D(latitude: 39.455797, longitude: -0.348977)
        
        let region = MKCoordinateRegion(center: sourceCoordinate, latitudinalMeters: 1000, longitudinalMeters: 10000)
        
        let destinationPin = MKPointAnnotation()
        destinationPin.coordinate = destinationCoordinate
        destinationPin.title = "Inicio"
        map.addAnnotation(destinationPin)
        
        let sourcePin = MKPointAnnotation()
        sourcePin.coordinate = sourceCoordinate
        sourcePin.title = "Final"
        map.addAnnotation(sourcePin)
        
        map.region = region
        map.delegate = context.coordinator
        
        let req = MKDirections.Request()
        req.source = MKMapItem(placemark: MKPlacemark(coordinate: sourceCoordinate))
        req.destination = MKMapItem(placemark: MKPlacemark(coordinate: destinationCoordinate))
        
        let directions = MKDirections(request: req)
        directions.calculate { (direct,err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            let polyline = direct?.routes.first?.polyline
            map.addOverlay(polyline!)
            map.setRegion(MKCoordinateRegion(polyline!.boundingMapRect), animated: true)
        }
        
        return map
        
    }
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<mapView>) {
    }
    
    class Coordinator : NSObject,MKMapViewDelegate{
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            
            let render = MKPolylineRenderer(overlay: overlay)
            render.strokeColor = .red
            render.lineWidth = 4
            return render
        }
    }
}
