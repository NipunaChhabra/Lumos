//
//  DevelopersVC.swift
//  lumos
//
//  Created by Nipuna Chhabra on 6/26/21.
//

import UIKit
private let reuseIdentifier = "Cell"
class DevelopersVC: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    var developers = ["Nipuna Chhabra", "Shaurya Sinha", "Omkar Masur", "Shubham Pathak", "Shravya Malya","Tinku Choudhary"]
    var pos = ["iOS developer", "Android Developer","API and Backend Management","API and Backend Management","UI/UX Design","Contributor"]
    var linkedin = ["https://www.linkedin.com/in/nipunachhabra/","https://www.linkedin.com/in/shaurya-sinha-66a026194"," https://in.linkedin.com/in/omkar-masur","https://www.linkedin.com/in/shubham-pathak-7093a11b9","http://www.linkedin.com/in/shravyasmallya","http://linkedin.com/in/tinku-choudhary-2250a8190"]
    var gits = ["https://github.com/NipunaChhabra","https://github.com/sinha-shaurya","https://github.com/oam-mit","https://github.com/pathak107","https://github.com/ShravyaMallya","https://github.com/tchtinku"]
    var img = ["nipuna","shaurya","omkar","shubham","shravya","tinku"]


    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(DeveloperCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.backgroundColor = UIColor(named: "whiteblack")
        
        self.navigationController?.navigationBar.tintColor = UIColor(named: "Accent")
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: "Accent")]
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DeveloperCell
        
        cell.backgroundColor = UIColor(named: "background")
        cell.NameLabel.text = developers[indexPath.item]
        cell.posLabel.text = pos[indexPath.item]
        cell.bgImage.image = UIImage(named: img[indexPath.item])
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width-20, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 20, left: 10, bottom: 20, right: 10)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
