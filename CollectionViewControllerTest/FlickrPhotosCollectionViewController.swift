//
//  FlickrPhotosCollectionViewController.swift
//  CollectionViewControllerTest
//
//  Created by EquipeSuporteAplicacao on 5/2/18.
//  Copyright © 2018 EquipeSuporteAplicacao. All rights reserved.
//

import UIKit

class FlickrPhotosCollectionViewController: UICollectionViewController {

    fileprivate let reuseIdentifier = "FlickrCell"
    
    fileprivate let sectionInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 5.0, right: 20.0)
    
    let itemsPerRow: CGFloat = 3
    
    @IBOutlet weak var layout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.layout.minimumInteritemSpacing = 5.0
        
        self.collectionView?.register(UINib(nibName: "FlickrCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: reuseIdentifier)
        
        // Do any additional setup after loading the view.
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FlickrCollectionViewCell

        cell.backgroundColor = UIColor.green
        cell.label.text = "Teste"
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch kind {
        case UICollectionElementKindSectionHeader:
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! FlickrPhotoCollectionReusableView
            headerView.lbl.text = "FOTOS"
            
            return headerView
        default: assert(false, "osso")
        }
    }

}

extension FlickrPhotosCollectionViewController : UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        //Esse é o espaço da tela já utilizado
        let espacoOcupadoPorAmbasAsMargens = self.sectionInsets.right + self.sectionInsets.left
        
        //Sobra 374
        let espacoDisponivel = view.frame.width - espacoOcupadoPorAmbasAsMargens
        
        //Quero 20 de espaço entre cada item
        let espacoFree = espacoDisponivel - 20

        //Quero que haja somente 2 items por linha
        let widthPerItem = espacoFree / 2
        
        print("espaco disponivel = \(espacoDisponivel)")
        print("espaco disponivel tirando os espados entre cada item = \(espacoFree)")
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
}

