//
//  ViewController+Utils.swift
//  Utils
//
//  Created by Allan Melo on 07/03/22.
//

import UIKit

public extension UIViewController {
    func addStackView() -> UIStackView {
        let stackView = UIStackView(frame: view.frame)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        view.addSubview(stackView)
        return stackView
    }
    
    func getStackView() -> UIStackView  {
        guard let stackView = view.subviews.first(where: { $0 is UIStackView }) as? UIStackView else {
            return addStackView()
        }
        
        return stackView
    }
    
    @discardableResult
    func addLabelName(text: String? = nil) -> UILabel {
        let label = UILabel(frame: .zero)
        label.text = text ?? self.debugDescription
        label.textAlignment = .center
        label.numberOfLines = 0
        getStackView().addArrangedSubview(label)
        
        return label
    }
    
    @discardableResult
    func addButton(text: String? = nil, textColor: UIColor? = nil, action: @escaping UIActionHandler) -> UIButton {
        let button = UIButton(frame: .zero)
        button.setTitle(text ?? "Button", for: .normal)
        button.setTitleColor(textColor ?? .black, for: .normal)
        button.addAction(.init(handler: action), for: .touchUpInside)
        
        getStackView().addArrangedSubview(button)
        return button
    }
}
