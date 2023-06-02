//
//  SaveCoreDataViewModel.swift
//  CoreDataMock
//
//  Created by JunHyeok Lee on 2023/06/01.
//

import UIKit

enum SaveCoreDataError: Error {
    case covertTypeError
    case SaveCoreDataError
}

final class SaveCoreDataViewModel {
    init() {
        
    }
    
    func convertStringIntoIntOfPhone(phone: String, ocmpletion: @escaping (Result<Int, SaveCoreDataError>) -> Void) {
        
    }
    
    func saveCoreData(nickname: String, phone: Int, email: String) {
        
    }
}
