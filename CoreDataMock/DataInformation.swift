//
//  DataInformation.swift
//  CoreDataMock
//
//  Created by JunHyeok Lee on 2023/06/02.
//

import Foundation

struct DataInformation: Equatable, Identifiable {
    typealias Identifier = String
    let id: Identifier
    let nickname: String?
    let email: String?
}
