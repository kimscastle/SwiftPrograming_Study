//
//  APICaller.swift
//  APIKit
//
//  Created by uiskim on 2023/05/10.
//

import Foundation


public class APICaller {
    public static let shared = APICaller()
    private init() {}
    
    public func fetchCoures<T: Codable>(returnType: T.Type, completion: @escaping(T) -> Void) {
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data, error == nil else { return }
            guard let model = try? JSONDecoder().decode(returnType.self, from: data) else { return }
            completion(model)
        }
        task.resume()
    }
}
