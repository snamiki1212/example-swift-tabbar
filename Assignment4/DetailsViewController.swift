//
//  DetailsViewController.swift
//  Assignment4
//
//  Created by shunnamiki on 2021/05/03.
//  Copyright © 2021 Derrick Park. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    func pushLabel(text: String) -> UIView {
        let view = UIView()
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        
        label.text = text
        label.textAlignment = .center
        view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        return view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let list: [UIView] = {
            // TODO: refactor
            if let previousVC = navigationController?.viewControllers[0] {
                if let cityVC = previousVC as? CityViewController {
                    if let city = cityVC.city {
                        var list = [UIView]()
                        
                        list.append(pushLabel(text: "Country"))
                        list.append(pushLabel(text: city.icon))
                        
                        list.append(pushLabel(text: "City"))
                        list.append(pushLabel(text: city.name))
                        
                        list.append(pushLabel(text: "Tempature"))
                        list.append(pushLabel(text: String(city.temp)))
                        
                        list.append(pushLabel(text: "Summary"))
                        list.append(pushLabel(text: city.summary))

                        return list
                    }
                }
            }
            return []
        }()
        
        print(list)
        
        let stack = UIStackView(arrangedSubviews: list)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
    }
    
 
}
