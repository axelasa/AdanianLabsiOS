//
//  PreviewViewController.swift
//  AdanianLabsTestiOS
//
//  Created by LCT AFRICA on 22/05/2022.
//

import UIKit

class PreviewViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    
    var preview:Hits?
    override func viewDidLoad() {
        super.viewDidLoad()
        
     let image = preview!.webformatURL
        if let image = try? Data(contentsOf: image){
            imageView.image = UIImage(data: image)
        }
        tagsLabel.text = ("Tags: \(preview!.tags)")
        userLabel.text = ("User: \(preview!.user)")
        
        // Do any additional setup after loading the view.
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
