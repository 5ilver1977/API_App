//
//  DataBaseManager.swift
//  API_App
//
//  Created by usuario on 16/8/22.
//

import Foundation
import Alamofire


// https://jsonplaceholder.typicode.com/photos

class DataBaseManager {
    static let shared = DataBaseManager(baseURL: URL(string: "https://jsonplaceholder.typicode.com/")!)

    let baseURL: URL

    private init(baseURL: URL) {
        self.baseURL = baseURL
    }

    func getPhotos(completion: @escaping([Photo]?, String?) -> Void) {
        Alamofire.request(self.baseURL.appendingPathComponent("photos"), method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            if let data = response.data {
                do {
                    let fotos = try JSONDecoder().decode([Photo].self, from: data)
                    completion(fotos, nil)

                } catch {
                    completion(nil, "Error al decodificar")

                }
            } else {
                completion(nil, "Error en la conexion")
            }

        }
    }
}




