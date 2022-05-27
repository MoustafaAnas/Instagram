//
//  Explore SearchBar Extention.swift
//  Instagram
//
//  Created by Moustafa Anas on 27/05/2022.
//

import UIKit

extension ExploreVC: UISearchBarDelegate {
    
    func setupSearchBar() {
        searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        didCancelSearchBar()
        guard let text = searchBar.text, !text.isEmpty else {return}
        
        query(text)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(didCancelSearchBar))
        
        dimmedView.isHidden = false
        UIView.animate(withDuration: 0.2) {
            self.dimmedView.alpha = 0.4
        } completion: { done in
            if done {
                self.tappedSearchBarCollectionView?.isHidden = false
            }
        }

    }
    
    @objc func didCancelSearchBar() {
        searchBar.resignFirstResponder()
        navigationItem.rightBarButtonItem = nil
        self.tappedSearchBarCollectionView?.isHidden = true
        
        UIView.animate(withDuration: 0.2) {
            self.dimmedView.alpha = 0
        } completion: { done in
            if done {
                self.dimmedView.isHidden = true
            }
        }
    }
    
    private func query(_ text: String) {
        // perform the search in the backend
    }
}



