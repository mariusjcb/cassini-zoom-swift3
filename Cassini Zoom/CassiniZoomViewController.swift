//
//  CassiniZoomViewController.swift
//  Cassini Zoom
//
//  Created by Marius Ilie on 29/12/16.
//  Copyright © 2016 University of Bucharest - Marius Ilie. All rights reserved.
//

import UIKit

class CassiniZoomViewController: UIViewController, UISplitViewControllerDelegate {
    private struct Storyboard {
        static let ShowImageSeque = "Show Image"
    }
    
    private func setImage(intoImageVC imagevc: ImageViewController?, withSender sender: Any?) {
        let imageName = (sender as? UIButton)?.currentTitle
        imagevc?.imageURL = DemoURL.NASAImage(named: imageName)
        imagevc?.title = imageName
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.ShowImageSeque {
            if let imagevc = segue.destination.contentViewController as? ImageViewController {
                setImage(intoImageVC: imagevc, withSender: sender)
            }
        }
    }
    
    @IBAction func showImage(_ sender: UIButton) {
        if let detailViewController = splitViewController?.viewControllers.last?.contentViewController as? ImageViewController {
            setImage(intoImageVC: detailViewController, withSender: sender)
        } else {
            performSegue(withIdentifier: Storyboard.ShowImageSeque, sender: sender)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitViewController?.delegate = self
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if primaryViewController.contentViewController == self  {
            if let imagevc = secondaryViewController.contentViewController as? ImageViewController, imagevc.imageURL == nil {
                return true
            }
        }
        
        return false
    }
}

extension UIViewController {
    var contentViewController: UIViewController {
        if let navcon = self as? UINavigationController {
            return navcon.visibleViewController ?? self
        } else {
            return self
        }
    }
}
