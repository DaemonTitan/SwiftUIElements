//
//  CodableDecodable.swift
//  UIElements
//
//  Created by Tony Chen on 29/2/2024.
//

import SwiftUI

// Codable = Decodable + Encodable
struct CustomerModel: Identifiable, Codable {
    var id: String
    let name: String
    let points: Int
    let isPremium: Bool
    
// Create coding keys
//    enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case points
//        case isPremium
//    }
    
//    init(id: String, name: String, points: Int, isPremium: Bool) {
//        self.id = id
//        self.name = name
//        self.points = points
//        self.isPremium = isPremium
//    }
//    
//    // Decode JSON data and map to cusotmer model make it customize
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.decode(String.self, forKey: .id)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.points = try container.decode(Int.self, forKey: .points)
//        self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
//    }
//    
//    // Encode data into JSON and make it customize
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(self.id, forKey: .id)
//        try container.encode(self.name, forKey: .name)
//        try container.encode(self.points, forKey: .points)
//        try container.encode(self.isPremium, forKey: .isPremium)
//    }
    
}

class CodableViewModel: ObservableObject {
    @Published var customer: CustomerModel? = nil
    
    init() {
        getData()
    }
    
    func getData() {
        // Data from API
        //guard let data = getJSONData() else { return }
        
        guard let data = encodeJSON() else { return }
        
        // Get data from JSON decoder
        do {
            self.customer = try JSONDecoder().decode(CustomerModel.self, from: data)
        } catch let error {
            print(error.localizedDescription)
        }

            // Decode JSON data into localData

            // Add localData into dictionary
            // Add decoded JSON data into dictionary

            // Create new customer

    }
    
    func getJSONData() -> Data? {
        // Convert dictionary to JSON
        let dictionary: [String: Any] = [
            "id": "1",
            "name": "Michael",
            "points": 20,
            "isPremium": true
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: dictionary, options: [])
        return jsonData
    }
    
    func encodeJSON() -> Data? {
        // Encode data into JSON
        let customer = CustomerModel(id: "23", name: "Tom", points: 20, isPremium: false)
        let jsonData = try? JSONEncoder().encode(customer)
        return jsonData
    }
}

struct CodableDecodable: View {
    @StateObject var vm = CodableViewModel()
    
    var body: some View {
        VStack {
            if let customer = vm.customer {
                Text(customer.id)
                Text(customer.name)
                Text("\(customer.points)")
                Text(customer.isPremium.description)
            }
        }
    }
}

#Preview {
    CodableDecodable()
}
