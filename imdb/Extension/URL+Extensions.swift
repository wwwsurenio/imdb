//
//  URL+Extensions.swift
//  imdb
//
//  Created by User01 on 18/6/23.
//

import Foundation
import UIKit

extension URL {
    func getImage() async -> UIImage? {
        guard let (data, _) = try? await URLSession.shared.data(from: self) else { return nil }
        guard let image = UIImage(data: data) else { return nil }
        return image
    }
}
