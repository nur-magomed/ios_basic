//
//  AyahTableViewCell.swift
//  hw13network
//
//  Created by Nur-Magomed A on 09.03.2025.
//

import UIKit

class AyahTableViewCell: UITableViewCell {
    

    @IBOutlet weak var ayahNumber: UILabel!
    
    @IBOutlet weak var arabicAyahLabel: UILabel!
    
    @IBOutlet weak var translatedAyahLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    public func configure(with ayah: Ayah, translatedAyah: Ayah?) {
        ayahNumber.text = "\(ayah.numberInSurah)"
        arabicAyahLabel.text = ayah.text
        guard let translatedAyah = translatedAyah else { return }
        translatedAyahLabel.text = translatedAyah.text
        
    }
}
