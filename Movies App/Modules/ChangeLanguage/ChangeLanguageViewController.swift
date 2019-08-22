//
//  ChangeLanguageViewController.swift
//  Movie App
//
//  Created by Ibrahim El-geddawy on 8/21/19.
//  Copyright © 2019 Ibrahim El-geddawy. All rights reserved.
//

import UIKit

class ChangeLanguageViewController: UITableViewController {
    static let ID = "ChangeLanguageViewController"

    @IBOutlet weak var englishLabel: UILabel!
    @IBOutlet weak var arabicLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        englishLabel.text = LanguageManager.sharedInstance.getDescription(of: .en)
        arabicLabel.text = LanguageManager.sharedInstance.getDescription(of: .ar)

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
       
        var lang: Language = .en
        if indexPath.row == 1 {
            lang = .ar
        }
        
        // Do nothing if the selected language is the current app language
        if LanguageManager.sharedInstance.getCurrentLanguage() == lang {
            return
        }
        
        LanguageManager.sharedInstance.setLanguage(to: lang)
        
        guard let window = UIApplication.shared.keyWindow else {
            
            return
            
        }
        
        let movieCategoriesVC = UIStoryboard(name: Storyboards.main, bundle: nil).instantiateViewController(withIdentifier: MoviesCategoriesViewController.ID) as! MoviesCategoriesViewController
        let nav = UINavigationController(rootViewController: movieCategoriesVC)

        let transition: UIView.AnimationOptions = lang == .en ? .transitionFlipFromLeft : .transitionFlipFromRight
        
        UIView.transition(with: window, duration: 1.0, options: transition, animations: {
            window.rootViewController?.dismiss(animated: false, completion: nil)
            window.rootViewController = nav
        }, completion: nil)
    }
    static func create()->ChangeLanguageViewController{
        return UIStoryboard(name: Storyboards.main, bundle: nil).instantiateViewController(withIdentifier: ChangeLanguageViewController.ID) as! ChangeLanguageViewController
    }
}
