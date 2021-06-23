//
//  ModelData.swift
//  searchOS
//
//  Created by シェイミ on 23/06/2021.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var oses: [MacOSModel] = Bundle.main.decode([MacOSModel].self, from: "macos.json")
}
