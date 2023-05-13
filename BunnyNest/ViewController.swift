//
//  ViewController.swift
//  BunnyNest
//
//  Created by Furkan Erdoğan on 13.05.2023.
//

import UIKit
import Lottie

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let collectionViewRabbit = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private lazy var imageView: UIImageView = {
       let iv = UIImageView()
       iv.setDimensions(width: 100, height: 100)
        iv.image = UIImage(named: "fox")
       iv.clipsToBounds = true
       
       return iv
       
   }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle(NSLocalizedString("Cevap Ver", comment: ""), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 20
        button.setDimensions(width: 220, height: 50)
        
        button.addTarget(self, action: #selector(questionButtonPressed), for: .touchUpInside)

        return button
    }()
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.text = "Tilki hızla yaklaşıyor. Her deliğe en fazla üç tavşanın girebileceği kadar zaman kaldı. Kaç tavşanın koşarak kaçması gerekiyor?"
        label.textColor = .black
        label.numberOfLines = 4
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("merhaba")
        view.backgroundColor = .green
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        
        collectionView.backgroundColor = .green
        
        view.backgroundColor = .green
        collectionViewRabbit.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        collectionViewRabbit.delegate = self
        collectionViewRabbit.dataSource = self
        view.addSubview(collectionViewRabbit)
        
        collectionViewRabbit.backgroundColor = .green
        
        view.addSubview(imageView)
        
        view.addSubview(questionLabel)
        view.addSubview(registerButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.setDimensions(width: view.frame.size.width, height: 220)
        collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: -50, paddingLeft: 20, paddingRight: 20)
        
        collectionViewRabbit.setDimensions(width: view.frame.size.width, height: 300)
        collectionViewRabbit.anchor(top: collectionView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 5, paddingRight: 5)
        
        imageView.centerX(inView: view, topAnchor: collectionViewRabbit.bottomAnchor, paddingTop: 5 )
        
        questionLabel.anchor(top: imageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 5, paddingLeft: 10, paddingRight: 10)
        
        registerButton.centerX(inView: view, topAnchor: questionLabel.bottomAnchor, paddingTop: 5 )
        
    }
    
    @objc func questionButtonPressed() {
        
        print("ahhh")
        let ac = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
           ac.addTextField()

           let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned ac] _ in
               let answer = ac.textFields![0]
               // do something interesting with "answer" here
               
               if answer.text == "4" {
                   let view = LottieAnimationView()
                   view.setDimensions(width: 350, height: 350)
                       let path = Bundle.main.path(forResource: "59945-success-confetti",
                                                   ofType: "json") ?? ""
                       view.animation = LottieAnimation.filepath(path)
                       self.view.addSubview(view)
                   view.loopMode = .repeat(2)
                   view.center(inView: self.view)
                       view.play()
               } else {
                   let view = LottieAnimationView()
                   view.setDimensions(width: 350, height: 350)
                       let path = Bundle.main.path(forResource: "11744-x-mark-no",
                                                   ofType: "json") ?? ""
                       view.animation = LottieAnimation.filepath(path)
                       self.view.addSubview(view)
                   view.loopMode = .repeat(2)
                   view.center(inView: self.view)
                       view.play()
               }
           }

           ac.addAction(submitAction)

           present(ac, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewRabbit {
            return 22
        } else if collectionView == collectionView {
            return 6
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        
        if collectionView == collectionViewRabbit {
            cell.imageView.image = UIImage(named: "rabbit")!
        } else if collectionView == collectionView {
            cell.imageView.image = UIImage(named: "nest")!
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViewRabbit {
            return CGSize(width: (view.frame.size.width / 6) - 3, height: (view.frame.size.width / 5) - 3)
        } else {
            return CGSize(width: (view.frame.size.width / 4) - 3, height: (view.frame.size.width / 4) - 3)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }


}

