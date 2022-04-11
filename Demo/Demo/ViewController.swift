//
// Copyright © 2022 An Tran. All rights reserved.
//

import Combine
import SwiftUI
import UIKit

final class ViewController: UIViewController {
    
    private lazy var instructionLabel: UILabel = {
        let label = UILabel()
        label.text = "Swipe from the right edge to open the Debug Menu"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        layout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateView()
    }
    
    func layout() {
        
        let button = UIButton()
        button.setTitle("Update View", for: .normal)
        button.setTitleColor(.tintColor, for: .normal)
        button.setTitleColor(.tintColor.withAlphaComponent(0.2), for: .highlighted)
        button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
      
        let stackView = UIStackView(arrangedSubviews: [instructionLabel, button])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 20
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: stackView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: stackView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: stackView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: stackView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0),
        ])

    }
    
    func updateView() {
        if UIApplication.flagsManager.homeFlags.showSecretFeature {
            instructionLabel.isHidden = false
        } else {
            instructionLabel.isHidden = true
        }
    }
    
    @objc func didTapButton() {
        updateView()
    }
}
