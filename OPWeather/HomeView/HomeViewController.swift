//
//  HomeViewController.swift
//  OPWeather
//
//  Created by Maiqui Cedeño on 16/08/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - OBOutlets
    @IBOutlet weak var currentCityImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var currentForecastLabel: UILabel!
    @IBOutlet weak var defaultCitiesTableView: UITableView!
    
    //MARK: - Properties
    var viewModel = HomeViewModel()
    
    private let cellId = "HomeTableViewCell"
    private var cities = ["New York", "Madrid", "Los Angeles", "Berlin", "London"]
    
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        bind()
        
        viewModel.getCity(cityString: "Madrid")
        
        
    }
    
    func setupUI() {
        
        defaultCitiesTableView.dataSource = self
        defaultCitiesTableView.delegate = self
        defaultCitiesTableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)

    }
    
    func bind() {
        
        viewModel.refreshData = {

        }

    }
}


extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)!
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {

}
