//
//  UIViewController+Alert.swift
//  CoreDataMock
//
//  Created by JunHyeok Lee on 2023/06/02.
//

import UIKit

extension UIViewController {
    func showAlertWithCancelAndConfirm(title: String, message: String, completion: @escaping() -> Void) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        let cancel = UIAlertAction(title: "취소", style: .default, handler: nil)
        let confirm = UIAlertAction(title: "확인", style: .destructive, handler: { _ in
            completion()
        })
        alert.addAction(cancel)
        alert.addAction(confirm)
        present(alert, animated: true, completion: nil)
    }
    
    func showAlertWithConfirm(title: String, message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        let confirm = UIAlertAction(title: "확인", style: .destructive, handler: { _ in
            completion?()
        })
        alert.addAction(confirm)
        present(alert, animated: true, completion: nil)
    }
}
