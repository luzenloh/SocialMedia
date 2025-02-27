//
//  AnimatedHeartButton.swift
//  SocialMedia
//
//  Created by Danis Bagautdinov on 27.02.2025.
//

import UIKit

class AnimatedHeartButton: UIButton {

    private let normalColor = UIColor.systemGray
    private let selectedColor = UIColor(hex: "#FF4081FF")

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }

    private func setupButton() {

        let heartImage = UIImage(systemName: "heart")
        setImage(heartImage, for: .normal)
        tintColor = normalColor


        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc private func buttonTapped() {
        isSelected.toggle()
        animateSelection()
    }

    private func animateSelection() {
        UIView.animate(withDuration: 0.3, animations: {

            self.tintColor = self.isSelected ? self.selectedColor : self.normalColor

            self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { _ in
            UIView.animate(withDuration: 0.2) {
                self.transform = .identity
            }
        }
    }
}
