//
//  SurahTableViewCell.swift
//  hw13network
//
//  Created by Nur-Magomed A on 09.03.2025.
//

import UIKit

class SurahTableViewCell: UITableViewCell {

    @IBOutlet weak var surahNumber: UILabel!
    
    @IBOutlet weak var englishName: UILabel!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var translatedName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func configure(with surah: Surah) {
        surahNumber.text = "\(surah.number)"
        englishName.text = surah.englishName
        translatedName.text = surah.englishNameTranslation
        name.text = surah.name
    }

}
