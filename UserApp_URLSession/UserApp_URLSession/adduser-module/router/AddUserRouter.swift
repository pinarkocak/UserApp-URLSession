//
//  AddUserRouter.swift
//  UserApp_URLSession
//
//  Created by Pınar Koçak on 25.04.2022.
//

class AddUserRouter: PresenterToRouterLKisiKayitProtocol {
    static func createModule(ref: AddUserViewController) {
        let presenter = AddUserPresenter()
        
        ref.kisiKayitPresenterObj = presenter
        ref.kisiKayitPresenterObj?.kisiKayitInteractor = AddUserInteractor()
    }
}

