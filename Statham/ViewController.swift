//
//  ViewController.swift
//  Statham
//
//  Created by Елизавета on 18.03.2020.
//  Copyright © 2020 Елизавета. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var vStack: UIStackView!
    var imageView = UIImageView(frame: CGRect(x: 0, y: 45, width: 350,height: 250))
    var label1 = UILabel.init()
    var label2 = UILabel.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.backgroundColor = .lightGray
        button.setTitle("Еще", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        vStack.spacing = 20
        label1.numberOfLines = 0
        imageView.image = UIImage(named:"4")
        label1.text = "Запускаем гуся, работяги"
        label2.text = "© Джейсон Стейтем"
        vStack.addArrangedSubview(imageView)
        vStack.addArrangedSubview(label1)
        vStack.addArrangedSubview(label2)
         label1.font = label1.font.withSize(35)
        label2.font = label2.font.withSize(20)
        vStack.addArrangedSubview(button)
    }

    @objc func buttonAction(sender: UIButton!) {
        let path = Bundle.main.path(forResource: "imageList", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        let data = dict?.object(forKey: "Images") as! [String]
        let quotes = dict?.object(forKey: "Quotes") as! [String]
        imageView.image = UIImage(named: data.randomElement()!)
        label1.text = quotes.randomElement()
    }
}
