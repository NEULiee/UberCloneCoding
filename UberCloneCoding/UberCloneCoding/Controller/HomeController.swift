//
//  HomeController.swift
//  UberCloneCoding
//
//  Created by neuli on 2022/05/12.
//

import UIKit
import Firebase
import MapKit

class HomeController: UIViewController {
    
    // MARK: - Properties
    
    private let mapView = MKMapView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
        //signOut()
    }
    
    // MARK: - API
    
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            let nav = UINavigationController(rootViewController: LoginController())
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true, completion: nil)
        } else {
            configureUI()
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("DEBUG: Error siging out")
        }
    }
    
    // MARK: - Helper Functions
    
    func configureUI() {
        
        view.addSubview(mapView)
        mapView.frame = view.frame
    }
}
