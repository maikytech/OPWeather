//
//  HomeViewController.swift
//  OPWeather
//
//  Created by Maiqui Cedeño on 16/08/21.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController {
    
    //MARK: - OBOutlets
    @IBOutlet weak var currentCityImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var currentForecastLabel: UILabel!
    @IBOutlet weak var defaultCitiesTableView: UITableView!
    
    //MARK: - Properties
    private var viewModel = HomeViewModel()
    private let cellId = "HomeTableViewCell"
    private var cities = ["New York", "Madrid", "Los Angeles", "Berlin", "London"]
    private var locationManager: CLLocationManager?
    private var userLocation: CLLocation?
//    private var latitudD: CLLocationDegrees?
//    private var longitudD: CLLocationDegrees?
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        bind()
        //viewModel.getByCity(cityString: "Madrid", requestBy: "City")
        requestLocation()
     
        
    }
    
    private func setupUI() {
        
        defaultCitiesTableView.dataSource = self
        defaultCitiesTableView.delegate = self
        defaultCitiesTableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
    }
    
    //Link ViewModel with View.
    private func bind() {
        
        viewModel.refreshData = { [weak self] () in
            DispatchQueue.main.async {
                self?.defaultCitiesTableView.reloadData()
            }
        }
    }
    
    private func requestLocation() {
        //is GPS active?
        guard CLLocationManager.locationServicesEnabled() else {
            return
        }
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
    }
    
   
}

//MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)!
        
        return cell
    }
}

//MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {

}

//MARK: - CLLocationManagerDelegate
extension HomeViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let bestLocation = locations.last else {
            return
        }
        
        //We get the user location
        userLocation = bestLocation
        
        guard let latitud = userLocation?.coordinate.latitude, let longitude = userLocation?.coordinate.longitude else {
            return
        }
        
        self.viewModel.getByCoordinates(latitude: latitud, longitude: longitude)
    }
    
}
