//
//  ExploreVC.swift
//  Instagram
//
//  Created by Moustafa Anas on 18/05/2022.
//

import UIKit

class ExploreVC: UIViewController {

    @IBOutlet weak var exploreCV: UICollectionView!
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search"
        searchBar.backgroundColor = .secondarySystemBackground
        return searchBar
    }()
    
    let dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.isHidden = true
        view.alpha = 0
        return view
    }()
    
    var tappedSearchBarCollectionView: UICollectionView?
    let models = [UserPost]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        setupSearchBar()
        navigationController?.navigationBar.topItem?.titleView = searchBar
        customizeDimmedView()
        configureTappedSearchBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        dimmedView.frame = view.bounds
        tappedSearchBarCollectionView?.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.frame.width, height: 72)
    }
    
    func customizeDimmedView() {
        view.addSubview(dimmedView)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didCancelSearchBar))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTapsRequired = 1
        dimmedView.addGestureRecognizer(gesture)
    }
    
    private func configureTappedSearchBar() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width/3, height: 52)
        layout.scrollDirection = .horizontal
        tappedSearchBarCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        tappedSearchBarCollectionView?.backgroundColor = .secondarySystemBackground
        tappedSearchBarCollectionView?.isHidden = true
        guard let tappedSearchBarCollectionView = tappedSearchBarCollectionView else {return}
        tappedSearchBarCollectionView.delegate = self
        tappedSearchBarCollectionView.dataSource = self
        view.addSubview(tappedSearchBarCollectionView)
    }

}

