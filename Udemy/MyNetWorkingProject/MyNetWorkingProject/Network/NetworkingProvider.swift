//
//  NetworkingProvider.swift
//  MyNetWorkingProject
//
//  Created by Javier Rodríguez Gómez on 1/11/21.
//


import Foundation
import Alamofire

final class NetworkingProvider {
    static let shared = NetworkingProvider()
    
    private let baseUrl = "https://gorest.co.in/public/v1/"
    private let statusOk = 200...299
    private let token = " " //se supone que aquí va la clave de autenticación que se obtiene en la web de gorest
    
    func getUser(id: Int, success: @escaping (_ user: User) -> (), failure: @escaping (_ error: Error?) -> ()) {
        let url = "\(baseUrl)users/\(id)"
        
        AF.request(url, method: .get).validate(statusCode: statusOk).responseDecodable (of: UserResponse.self, decoder: DateDecoder()) { response in
            if let user = response.value?.data {
                success(user)
            } else {
                failure(response.error)
            }
        }
    }
    
    func addUser(user: NewUser, success: @escaping (_ user: User) -> (), failure: @escaping (_ error: Error?) -> ()) {
        let url = "\(baseUrl)users"
        
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        
        AF.request(url, method: .post, parameters: user, encoder: JSONParameterEncoder.default, headers: headers).validate(statusCode: statusOk).responseDecodable (of: UserResponse.self, decoder: DateDecoder()) { response in
            if let user = response.value?.data, user.id != nil {
                success(user)
            } else {
                failure(response.error)
            }
        }
    }
    
    func updateUser(id: Int, user: NewUser, success: @escaping (_ user: User) -> (), failure: @escaping (_ error: Error?) -> ()) {
        let url = "\(baseUrl)users/\(id)"
        
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        
        AF.request(url, method: .put, parameters: user, encoder: JSONParameterEncoder.default, headers: headers).validate(statusCode: statusOk).responseDecodable (of: UserResponse.self, decoder: DateDecoder()) { response in
            if let user = response.value?.data, user.id != nil {
                success(user)
            } else {
                failure(response.error)
            }
        }
    }
    
    func deleteUser(id: Int, success: @escaping () -> (), failure: @escaping (_ error: Error?) -> ()) {
        let url = "\(baseUrl)users/\(id)"
        
        let headers: HTTPHeaders = [.authorization(bearerToken: token)]
        
        AF.request(url, method: .delete, headers: headers).validate(statusCode: statusOk).response { response in
            if let error = response.error {
                failure(error)
            } else {
                success()
            }
        }
    }
    
}

