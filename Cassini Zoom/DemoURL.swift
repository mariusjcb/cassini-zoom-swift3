//
//  DemoURL.swift
//  Cassini Zoom
//
//  Created by Marius Ilie on 28/12/16.
//  Copyright © 2016 University of Bucharest - Marius Ilie. All rights reserved.
//

import Foundation

struct DemoURL {
    static let Stanford = "https://s3-us-west-2.amazonaws.com/insideiim/wp-content/uploads/2016/05/26014711/stanford-campus.png"
    
    static let NASA = [
        "Cassini" : "http://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg",
        "Earth" : "http://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg",
        "Saturn" : "http://www.nasa.gov/sites/default/files/saturn_collage.jpg"
    ]
    
    static func NASAImage(named: String?) -> URL? {
        if let URLString = NASA[named ?? ""] {
            return URL(string: URLString)
        } else {
            return nil
        }
    }
}
