//
//  ListSearchFilterViewModel.swift
//  UIElements
//
//  Created by Tony Chen on 15/8/2024.
//

import Foundation
import CoreLocation

struct SelectedCityDetail: Identifiable {
    let id = UUID()
    let cityDetail: CityDetail?
    let cityHistory: CityHistory?
}

struct CityDetail: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let city: String
    let state: String
    let country: String
    let coordinate: CLLocationCoordinate2D
}

struct CityHistory: Identifiable, Codable {
    let id: Int
    let year: String
    let historyName: String
    let historyDetail: String
    let kingName: String
}

@MainActor
class CityViewModel: ObservableObject {
    @Published var searchResults = [SelectedCityDetail]()
    @Published var savedCity = [SelectedCityDetail]()
    @Published var searchText = ""
    
    func searchCity(query: String, in cities: [SelectedCityDetail]) {
        if query.isEmpty {
            searchResults = cities
        } else {
            searchResults = cities.filter { $0.cityDetail?.title.localizedCaseInsensitiveContains(query) ?? false }
        }
    }
}



var cityList = [
    SelectedCityDetail(cityDetail: CityDetail(title: "Sydney",
                                              subtitle: "NSW Australia",
                                              city: "",
                                              state: "",
                                              country: "",
                                              coordinate: CLLocationCoordinate2DMake(1.0, 1.0)),
                       cityHistory: CityHistory(id: 1,
                                                year: "Every year",
                                                historyName: "Olympic",
                                                historyDetail: "Sydney Olmpic 2000",
                                                kingName: "No name")),
    
    SelectedCityDetail(cityDetail: CityDetail(title: "Melbourne",
                                              subtitle: "Victoria Australia",
                                              city: "",
                                              state: "",
                                              country: "",
                                              coordinate: CLLocationCoordinate2DMake(2.0, 2.0)),
                       cityHistory: CityHistory(id: 1,
                                                year: "2000",
                                                historyName: "Fomular 1",
                                                historyDetail: "Fomular 1 Melboune",
                                                kingName: "Michael Smith")),
    
    SelectedCityDetail(cityDetail: CityDetail(title: "Brisbane",
                                              subtitle: "Queensland Australia",
                                              city: "",
                                              state: "",
                                              country: "",
                                              coordinate: CLLocationCoordinate2DMake(3.0, 3.0)),
                       cityHistory: CityHistory(id: 1,
                                                year: "2028",
                                                historyName: "Olympic",
                                                historyDetail: "Brisbane Olmpic 2028",
                                                kingName: "Charles Jones")),
    
    SelectedCityDetail(cityDetail: CityDetail(title: "Perth",
                                              subtitle: "West Australia, Australia",
                                              city: "",
                                              state: "",
                                              country: "",
                                              coordinate: CLLocationCoordinate2DMake(4.0, 4.0)),
                       cityHistory: CityHistory(id: 1,
                                                year: "N/A",
                                                historyName: "N/A",
                                                historyDetail: "N/A",
                                                kingName: "Alan Jordan")),
    
    SelectedCityDetail(cityDetail: CityDetail(title: "Adelaide",
                                              subtitle: "South Australia, Australia",
                                              city: "",
                                              state: "",
                                              country: "",
                                              coordinate: CLLocationCoordinate2DMake(5.0, 5.0)),
                       cityHistory: CityHistory(id: 1,
                                                year: "2020",
                                                historyName: "WTA Adelaide",
                                                historyDetail: "WTA adeliade Men & Women",
                                                kingName: "Joe Smith")),
    
    SelectedCityDetail(cityDetail: CityDetail(title: "Hobart",
                                              subtitle: "Tasmania Australia",
                                              city: "",
                                              state: "",
                                              country: "",
                                              coordinate: CLLocationCoordinate2DMake(6.0, 6.0)),
                       cityHistory: CityHistory(id: 1,
                                                year: "2030",
                                                historyName: "Olympic",
                                                historyDetail: "Hobart Olmpic 2030",
                                                kingName: "no name"))
]
