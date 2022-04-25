//
//  MainPageInteractor.swift
//  UserApp_URLSession
//
//  Created by Pınar Koçak on 25.04.2022.
//

import Foundation

class MainPageInteractor: PresenterToInteractorAnaSayfaProtocol {
    var anaSayfaPresenter: InteractorToPresenterAnaSayfaProtocol?
    
    func fetchAllPeople() {
        let url = URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil || data == nil {
                print("Error")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(PersonResult.self, from: data!)
                if let list = result.kisiler {
                    self.anaSayfaPresenter?.sendDataToPresenter(personList: list)
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()

    }
    
    func searchPerson(search: String) {
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php")!)
        request.httpMethod = "POST"
        let postString = "kisi_ad=\(search)"
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil || data == nil {
                print("Error")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(PersonResult.self, from: data!)
                
                if let list = result.kisiler {
                    self.anaSayfaPresenter?.sendDataToPresenter(personList: list)
                }
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    func deletePerson(person_id: Int) {
        var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php")!)
        request.httpMethod = "POST"
        let postString = "kisi_id=\(person_id)"
        request.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil || data == nil {
                print("Error")
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
                    print(json)
                    self.fetchAllPeople()
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}

