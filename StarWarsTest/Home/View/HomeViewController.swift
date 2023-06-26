//
//  ViewController.swift
//  StarWarsTest
//
//  Created by Kevin Velazquez Zamudio on 20/06/23.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var mainCollectionView: UICollectionView!
    weak var factoryCoordinator: FilmCoordinators?
    
    var viewModel = FilmsViewModel()
    var modelReponse: FilmDataResponse?
    var myFilms: [FilmsResults] = []
    var nameChapter = ""
    var episodesImage = [UIImage(named: "Episode-4"), UIImage(named: "Episode-5"), UIImage(named: "Episode-6"), UIImage(named: "Episode-1"), UIImage(named: "Episode-2"), UIImage(named: "Episode-3"), UIImage(named: "Episode-7")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    
    func setUp() {
        viewModel.getFilmsData()
        viewModel.delegate = self
        mainCollectionView.register(UINib(nibName: "FilmsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FilmIdentifier")
        
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        
    }
    
    func shorErrorAlert() {
        let alert = UIAlertController(title: "Error", message: "Lo sentimos ocurrió un error inesperado, intentalo más tardde", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default) { (_) in
            print("Load Successfully")
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func gotoDetail(nameChapter: String, imageFilm: UIImage, description: String, producer: String, director: String, releaseDate: String) {
        let storyBoard = UIStoryboard(name: "DetailFilmStorybard", bundle: Bundle(for: HomeViewController.self))
        let vc = storyBoard.instantiateViewController(identifier: "IdentifierDetail") as! DetailFilmViewController
        vc.nameLabel = nameChapter
        vc.imageChapter? = imageFilm
        vc.descriptionFilm = description
        vc.producer = producer
        vc.director = director
        vc.releaaseDate = releaseDate
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension HomeViewController: FilmsViewProtocol {
    
    func didGetFilmsData(data: FilmDataResponse) {
            if let films = data.results {
                    self.myFilms = films
            }
                
        mainCollectionView.reloadData()
    }
    
    func didFailGetFilmsData(error: String) {
        shorErrorAlert()
    }
    
    
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myFilms.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilmIdentifier", for: indexPath) as! FilmsCollectionViewCell
        nameChapter = myFilms[indexPath.row].title ?? ""
        cell.chapterImage.image = episodesImage[indexPath.row]
        cell.lblChapter.text = nameChapter
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let nameChapter = myFilms[indexPath.row].title, let imageEpisode = episodesImage[indexPath.row], let descript = myFilms[indexPath.row].opening_crawl, let producer = myFilms[indexPath.row].producer, let director = myFilms[indexPath.row].director, let releaseDate = myFilms[indexPath.row].release_date {
            
            gotoDetail(nameChapter: nameChapter, imageFilm: imageEpisode, description: descript, producer: producer, director: director, releaseDate: releaseDate )

        }

    }
    
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 190, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
        
    }
    
}

