//
//  ListSearchFilter.swift
//  UIElements
//
//  Created by Tony Chen on 15/8/2024.
//

import SwiftUI

struct ListSearchFilter: View {
    @StateObject private var cityListVM = CityViewModel()
    @State private var searchText: String = ""
    private var CityData = [SelectedCityDetail]()
    
    var filteredData: [SelectedCityDetail] {
        return CityData.filter { $0.cityDetail?.title.localizedCaseInsensitiveContains(searchText) ?? false }
    }
    
    var body: some View {
        NavigationStack {
                List(filteredData, id: \.id) { city in
                    if let city = city.cityDetail {
                        Text("\(city.title)")
                    }
                    
                    
                }
            .searchable(text: $searchText, prompt: "Search City")
            .navigationTitle("Search")
            
        }
    }
}

#Preview {
    ListSearchFilter()
}
