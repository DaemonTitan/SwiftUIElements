//
//  SearchableItem.swift
//  UIElements
//
//  Created by Tony Chen on 19/8/2024.
//

import SwiftUI
import Combine

struct Restaurant: Identifiable, Hashable {
    let id: String
    let title: String
    let cuisine: CuisineOption
}

enum CuisineOption: String {
    case american, italian, japanese, australian
}


final class RestaurantManager {
    
    func getAllRestaurants() async throws -> [Restaurant] {
        [
            Restaurant(id: "1", title: "Burger Shack", cuisine: .american),
            Restaurant(id: "2", title: "Pasta Place", cuisine: .italian),
            Restaurant(id: "3", title: "Sushi Hub", cuisine: .japanese),
            Restaurant(id: "4", title: "Fish Boat", cuisine: .australian),
            Restaurant(id: "5", title: "Burger Hunt", cuisine: .american)
        ]
    }
}


@MainActor
final class SearchableViewModel: ObservableObject {
    let manager = RestaurantManager()
    @Published private(set) var allRestaurants: [Restaurant] = []
    @Published private(set) var filteredRestaurants: [Restaurant] = []
    @Published var searchText: String = ""
    @Published var searchScope: SearchScopeOption = .all
    @Published private(set) var allSearchScope: [SearchScopeOption] = []
    private var cancellable =  Set<AnyCancellable>()
    
    var isSearching: Bool  {
        !searchText.isEmpty
    }
    
    var showSearchSuggestions: Bool {
        searchText.count < 5
    }
    
    enum SearchScopeOption: Hashable {
        case all
        case cuisine(option: CuisineOption)
        
        var title: String {
            switch self {
            case .all:
                return "All"
            case .cuisine(option: let option):
                return option.rawValue.capitalized
            }
        }
    }
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        $searchText
            .combineLatest($searchScope)
            .debounce(for: 0.3, scheduler: DispatchQueue.main)
            .sink { [weak self] (searchText, searchScope) in
                self?.filterRestaurants(searchText: searchText, currentSearchScope: searchScope)
            }
            .store(in: &cancellable)
    }
    
    private func filterRestaurants(searchText: String, currentSearchScope: SearchScopeOption) {
        guard !searchText.isEmpty else {
            filteredRestaurants = []
            searchScope = .all
            return
        }
        // Filter on search scope
        var restaurantInScope = allRestaurants
        switch currentSearchScope {
        case .all:
            break
        case .cuisine( let option):
           restaurantInScope = allRestaurants.filter { $0.cuisine == option }
        }
        
        
        // Filter on search text
        let search = searchText.lowercased()
        filteredRestaurants = restaurantInScope.filter { restaurant in
            let titleContainsSearch = restaurant.title.localizedCaseInsensitiveContains(search)
            let cuisineContainsSearch = restaurant.cuisine.rawValue.localizedCaseInsensitiveContains(search)
            return titleContainsSearch || cuisineContainsSearch
        }
    
        
        
    }
    
    func loadRestaurant() async {
        do {
            allRestaurants = try await manager.getAllRestaurants()
            
            // Create unique array
            let allCuisine = Set(allRestaurants.map { $0.cuisine })
            allSearchScope = [.all] + allCuisine.map { SearchScopeOption.cuisine(option: $0) }
            
        } catch {
            print(error)
        }
    }
    
    func getSearchSuggestions() -> [String] {
        guard showSearchSuggestions else {
            return []
        }
        
        var suggestions: [String] = []
        
        let search = searchText.lowercased()
        if search.contains("Pa") {
            suggestions.append("Pasta")
        }
        if search.contains("Su") {
            suggestions.append("Sushi")
        }
        if search.contains("Bu") {
            suggestions.append("Burge")
        }
        suggestions.append("Market")
        suggestions.append("Grocery")
        
        suggestions.append(CuisineOption.italian.rawValue.capitalized)
        suggestions.append(CuisineOption.japanese.rawValue.capitalized)
        suggestions.append(CuisineOption.american.rawValue.capitalized)
        
        return suggestions
    }
    
    func getRestaruantSuggestions() -> [Restaurant] {
        guard showSearchSuggestions else {
            return []
        }
        
        var suggestions: [Restaurant] = []
        
        let search = searchText.lowercased()
        if search.contains("Ita") {
            suggestions.append(contentsOf: allRestaurants.filter { $0.cuisine == .italian })
        }
        if search.contains("Sus") {
            suggestions.append(contentsOf: allRestaurants.filter { $0.cuisine == .japanese })
        }
        if search.contains("Bur") {
            suggestions.append(contentsOf: allRestaurants.filter { $0.cuisine == .american })
        }
        
        return suggestions
    }
    
}

struct SearchableItem: View {
    @StateObject var searchVM = SearchableViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(searchVM.isSearching ? searchVM.filteredRestaurants : searchVM.allRestaurants) { restaurant in
                        NavigationLink(value: restaurant) {
                            restaurantRow(restaurant: restaurant)
                        }
                    }
                }
                .padding()
                
                Text("View Model is searching: \(searchVM.isSearching.description)")
                SearchChildView()
            }
            .navigationTitle("Restaurant")
            .searchable(text: $searchVM.searchText, placement: .automatic, prompt: "Search restaurant...")
            .searchScopes($searchVM.searchScope) {
                ForEach(searchVM.allSearchScope, id:\.self) { scope in
                    Text(scope.title)
                        .tag(scope)
                }
            }
            .searchSuggestions {
                ForEach(searchVM.getSearchSuggestions(), id: \.self) { suggestion in
                    Text(suggestion)
                        .searchCompletion(suggestion)
                }
                
                ForEach(searchVM.getRestaruantSuggestions(), id: \.self) { suggestion in
                    NavigationLink(value: suggestion) {
                        Text(suggestion.title)
                    }
                        
                }
            }
 //           .navigationBarTitleDisplayMode(.large)
            .navigationDestination(for: Restaurant.self) { restaruant in
                Text(restaruant.title.uppercased())
            }
        }
        .task {
            await searchVM.loadRestaurant()
        }

    }
    
    private func restaurantRow(restaurant: Restaurant) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(restaurant.title)
                .font(.headline)
                .foregroundStyle(.red)
            Text(restaurant.cuisine.rawValue.capitalized)
                .font(.caption)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.black.opacity(0.05))
    }
}

struct SearchChildView: View {
    @Environment(\.isSearching) private var searching
    
    var body: some View {
        Text("Child view is searching: \(searching.description)" )
    }
}

#Preview {
    SearchableItem()
}
