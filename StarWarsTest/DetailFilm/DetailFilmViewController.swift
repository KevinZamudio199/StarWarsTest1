//
//  DetailFilmViewController.swift
//  StarWarsTest
//
//  Created by Kevin Velazquez Zamudio on 22/06/23.
//

import UIKit

class DetailFilmViewController: UIViewController {
    
    @IBOutlet weak var filmImage: UIImageView!
    @IBOutlet weak var lblNameFilm: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblProducer: UILabel!
    @IBOutlet weak var lblDirector: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var optionsCollection: UICollectionView!
    var nameLabel = ""
    var imageChapter = UIImage(named: "Episode-1")
    var descriptionFilm = ""
    var producer = ""
    var director = ""
    var releaaseDate = ""
    var arrayOptions = ["Characters", "Vehicles", "Species", "Planets"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupCollection()
    }
    
    func setup() {
        lblNameFilm.text = nameLabel
        filmImage.image = imageChapter
        lblDescription.text = descriptionFilm
        lblDirector.text = "Director: \(director)"
        lblProducer.text = "Producer: \(producer)"
        lblReleaseDate.text = "ReleaseData: \(releaaseDate)"
    }
    
    func setupCollection() {
        optionsCollection.register(UINib(nibName: "OptionsCollectionViewCell", bundle: Bundle(for: HomeViewController.self)), forCellWithReuseIdentifier: "OptionIdentifier")
        optionsCollection.delegate = self
        optionsCollection.dataSource = self
    }
    
    func sendData(queryOption: String) {
        let storyBoard = UIStoryboard(name: "ListStoryboard", bundle: Bundle(for: HomeViewController.self))
        let vc = storyBoard.instantiateViewController(identifier: "ListIdentifier") as! ListViewController
        vc.queryOption =  queryOption
        present(vc, animated: true)
    }
    
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}

extension DetailFilmViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OptionIdentifier", for: indexPath) as! OptionsCollectionViewCell
        cell.lblOption.text = arrayOptions[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            sendData(queryOption: "people")
        case 1:
            sendData(queryOption: "vehicles")
        case 2:
            sendData(queryOption: "species")
        default:
            sendData(queryOption: "planets")
        }
    }
    
}

extension DetailFilmViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
    }
}
