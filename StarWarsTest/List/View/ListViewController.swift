//
//  ListViewController.swift
//  StarWarsTest
//
//  Created by Kevin Velazquez Zamudio on 22/06/23.
//

import UIKit

struct MainObject {
    var name: String
    var height: String
    var mass: String
    var hair_color: String
    var skin_color: String
    var eye_color: String
    var birth_year: String
    var gender: String
    var homeworld: String
}

class ListViewController: UIViewController {
    
    @IBOutlet weak var bottomShetView: UIView!
    @IBOutlet weak var mainSearch: UISearchBar!
    @IBOutlet weak var mainTableView: UITableView!
    
    var queryOption = ""
    var viewModel = ListViewModel()
    var mainList: [ListResults] = []
    var nameList = ""
    var newArray = [MainObject]()
    var mutableArray = [MainObject]()
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()

    }
    
    func setUp() {
        mainTableView.register(UINib(nibName: "ListTableViewCell", bundle: Bundle(for: HomeViewController.self)), forCellReuseIdentifier: "IdentifierList")
        mainTableView.delegate = self
        mainTableView.dataSource = self
        viewModel.delegate = self
        mainSearch.delegate = self
        viewModel.onGetList(query: queryOption)
        bottomShetView.layer.cornerRadius = 10
        mainSearch.layer.cornerRadius = 10
    }
    
    func showAlertError() {
        
    let alert = UIAlertController(title: "Error", message: "Lo sentimos ocurrió un error inesperado, intentalo más tardde", preferredStyle: .alert)
    
    let action = UIAlertAction(title: "OK", style: .default) { (_) in
        print("Load Successfully")
    }
    alert.addAction(action)
    present(alert, animated: true)
}
    
}

extension ListViewController: ListViewProtocol {
    func didGetListView(data: ListModelResponse) {
        data.results?.forEach({ names in
          let object = MainObject(name: names.name ?? "", height: "", mass: "", hair_color: "", skin_color: "", eye_color: "", birth_year: "", gender: "", homeworld: names.homeworld ?? "")
            newArray.append(object)
            mutableArray = newArray
        })
        
        mainTableView.reloadData()
        
    }
    
    func didFailList() {
        showAlertError()
    }
    
    
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IdentifierList", for: indexPath) as! ListTableViewCell
        cell.lblName.text = newArray[indexPath.row].name

        return cell
    }
    
}

extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            print("vacio")
            newArray = mutableArray
            mainTableView.reloadData()
        }else{
            newArray = mutableArray.filter{ $0.name.lowercased().contains(searchText.lowercased())
            }
        }
        mainTableView.reloadData()
            
        }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
