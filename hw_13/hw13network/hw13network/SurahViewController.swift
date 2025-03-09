//
//  SurahViewController.swift
//  hw13network
//
//  Created by Nur-Magomed A on 09.03.2025.
//

import UIKit

class SurahViewController: UIViewController {
    
    
    @IBOutlet weak var ayahsTableView: UITableView!
    
    
    private let networkLayer = NetworkLayer()
    var surahNumber = 1
    private var surah: Surah?
    private var translatedSurah: Surah?
    override func viewDidLoad() {
        super.viewDidLoad()

        networkLayer.getSurah(surahNumber: surahNumber) {result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let wrong):
                    print(wrong)
                case .success(let loadedSurah):
                    self.surah = loadedSurah
                }
            }}
        
        networkLayer.getTranslatedSurah(surahNumber: surahNumber, edition: "ru.muntahab") {result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let wrong):
                    print(wrong)
                case .success(let loadedSurah):
                    self.translatedSurah = loadedSurah
                    self.ayahsTableView.reloadData()
                }
            }}
    }

}


extension SurahViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return surah?.numberOfAyahs ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AyahCellId", for: indexPath)
                as? AyahTableViewCell else {
            return tableView.dequeueReusableCell(withIdentifier: "DefaultCellId", for: indexPath)
        }
        cell.configure(with: surah!.ayahs[indexPath.row], translatedAyah: translatedSurah!.ayahs[indexPath.row])
        return cell
    }
}
