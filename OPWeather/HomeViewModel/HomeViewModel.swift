//
//  HomeViewModel.swift
//  OPWeather
//
//  Created by Maiqui Cedeño on 12/08/21.
//

import Foundation

class HomeViewModel {
    
    //Update Data
    var refreshData = {
        () -> () in
    }
    
    public var dataArray: City? {
        didSet {
            refreshData()
        }
    }
    
}
