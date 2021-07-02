//
//  SettingsLauncher.swift
//  youtube
//
//  Created by Brian Voong on 6/17/16.
//  Copyright © 2016 letsbuildthatapp. All rights reserved.
//

import UIKit

class Setting: NSObject {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

class SettingsLauncher: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var homeController: BlogCollectionVC?
    
    let blackView = UIView()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        return cv
    }()
    
    let cellId = "cellId"
    let cellHeight: CGFloat = 50
    
    let settings: [Setting] = {
        return [Setting(name: "Theme"), Setting(name: "AboutUs"), Setting(name: "Developers")]
    }()
    
    func showSettings() {
        //show menu
        
        if let window = UIApplication.shared.keyWindow {
            
            blackView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
            blackView.alpha = 0.25
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            blackView.frame = window.frame
            window.addSubview(blackView)
        
            window.addSubview(collectionView)
            collectionView.alpha = 1
            
            let height: CGFloat = CGFloat(settings.count) * cellHeight
            let width = CGFloat(150)
            let x = window.frame.width - width
            let y = (self.homeController?.navigationController!.navigationBar.frame.height)!+40
            collectionView.frame = CGRect(x: x, y: y, width: width, height: height)
            
            
            

        }
    }
    
    @objc func handleDismiss() {
        self.blackView.alpha = 0
        self.collectionView.alpha = 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let setting = self.settings[indexPath.item]
        handleDismiss()
        self.homeController?.showControllerForSetting(setting: setting)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settings.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SettingCell
        
        let setting = settings[indexPath.item]
        cell.setting = setting
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override init() {
        super.init()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(SettingCell.self, forCellWithReuseIdentifier: cellId)
    }
    
}







