//
//  PICXViewController.swift
//  AdanianLabsTestiOS
//
//  Created by Axel Asa on 22/05/2022.
//

import UIKit
import Alamofire

class PICXViewController: UIViewController,UISearchBarDelegate {
    @IBOutlet weak var PhotosTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var results:Response?
    var details:[Hits]!
    var images:URL?
    var querr:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        PhotosTableView.delegate = self
        PhotosTableView.dataSource = self
        searchBar.delegate = self
        // Do any additional setup after loading the view.
        self.getPhotos()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func getPhotos(){
        NetworkCall.shareInstance.callPicsApi{ (result) in
            switch result{
            case .success(let json):
                dump(json)
                self.results = (json as! Response)
                dump(self.results!.hits)
                DispatchQueue.main.async {
                    self.PhotosTableView.reloadData()
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchBar.text = ""
    searchBar.endEditing(true)

    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("search = \(searchText)")
        
        querr = searchText
        
        if searchText == "" {
            details = results!.hits
            //print("HERE I AM ->>>>\(querry!.search)")
        }else{
            for word in results!.hits{
                if word.tags.lowercased().contains(searchText.lowercased()){
                    details?.append(word)
                }
            }
        }
        self.PhotosTableView.reloadData()
    }

    @IBAction func searchPhotos(_ sender: Any) {
        NetworkCall.shareInstance.searchImageApi(param:querr) { (response) in
            switch response{
            case.success(let json):
                dump(json)
                self.results = (json as! Response)
                dump(self.results!.hits)
                DispatchQueue.main.async {
                    self.PhotosTableView.reloadData()
                }
            case.failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

extension PICXViewController :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.results?.hits.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PixabayCell", for: indexPath) as? PixaBayTableViewCell
        let data = self.results!.hits[indexPath.row]
        cell?.tagsLabel?.text = data.tags
        cell?.userLabel.text = data.user
        let  photo = data.webformatURL
        if let photo = try? Data(contentsOf: photo){
            cell?.picsView.image = UIImage(data: photo)
        }
        
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pics = self.results!.hits[indexPath.row]
        if let selectedPicController = storyboard?.instantiateViewController(identifier: "previewVC") as? PreviewViewController{
            selectedPicController.preview = pics
            navigationController?.pushViewController(selectedPicController, animated: true)
        }
    }
}

//extension PICXViewController :UISearchBarDelegate{
    
//func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        print("search = \(searchText)")
//
//        self.dupList = searchText.isEmpty ? list : list.filter({ (model) -> Bool in
//            return  model.name!.range(of: searchText, options: .caseInsensitive, range: nil, locale:nil) != nil
//        })
//
//        self.tableView.reloadData()
//    }
