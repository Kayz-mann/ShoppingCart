//
//  NetworkManager.swift
//  Appetizer
//
//  Created by Balogun Kayode on 02/07/2024.
//

import Foundation
import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    private init() {}
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        //get appetizer function returns a result, success [Appetizer] or failure case  APError
        
        //check for a good URL else return invalide url error response
        guard let url  = URL(string: appetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task  = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, response, error in
            //if error has a value do completion handler
            if let _  = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            //check for http response
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            //if no data return invalid data!!!!
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        //if image object exist return image
        if let image  = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, response, error in
            //if data process data to image else set image reult nil
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            //cache image
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)

        }
        
        task.resume()
        
    }
}
