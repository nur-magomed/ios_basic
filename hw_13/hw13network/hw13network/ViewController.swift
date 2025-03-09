//
//  ViewController.swift
//  hw13network
//
//  Created by Nur-Magomed A on 01.03.2025.
//

import UIKit

class ViewController: UIViewController {
    
 
    @IBOutlet weak var tableView: UITableView!
    
    private let networkLayer = NetworkLayer()
    private var surahs: [Surah] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Quran"
        
        networkLayer.getMetaData { result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let wrong):
                    print(wrong)
                case .success(let loadedSurahs):
                    self.surahs = loadedSurahs
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return surahs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SurahCellId", for: indexPath)
                as? SurahTableViewCell else {
            return tableView.dequeueReusableCell(withIdentifier: "DefaultCellId", for: indexPath)
        }
        cell.configure(with: surahs[indexPath.row])
        return cell
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "SurahViewSegueId", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SurahViewSegueId" {
            if let destinationVC = segue.destination as? SurahViewController,
               let selectedIndexPath = tableView.indexPathForSelectedRow {
                destinationVC.surahNumber = surahs[selectedIndexPath.row].number
            }
        }
    }
}
