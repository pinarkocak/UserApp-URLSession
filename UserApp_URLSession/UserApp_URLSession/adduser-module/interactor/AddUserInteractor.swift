//
//  AddUserInteractor.swift
//  UserApp_URLSession
//
//  Created by Pınar Koçak on 25.04.2022.
//

import Foundation

class AddUserInteractor: PresenterToInteractorKisiKayitProtocol {
    func kisiEkle(person_name: String, person_number: String) {
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php")!)
        request.httpMethod = "POST"
        let postString = "kisi_ad=\(person_name)&kisi_tel=\(person_number)"
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil || data == nil {
                print("Error")
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
                    print(json)
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()

    }
}

