//
//  LunchCollectionViewCell.swift
//  BottleRocketAssignement
//
//  Created by  Created by Nicholas Gilbert on 4/15/21.
//

import UIKit

class LunchViewCell: UICollectionViewCell {
    @IBOutlet weak var lunchImage: UIImageView!
    @IBOutlet weak var resturantNameLabel: UILabel!
    @IBOutlet weak var categoryTypeLabel: UILabel!
    
    static let reuseId = String(describing: LunchViewCell.self)
    var viewModel:LunchViewModel?
    
    func configure(with viewModel:LunchViewModel){
        let urlString = viewModel.backgroundImageURL
        print(urlString)
        
        let url = URL(string: urlString)
        print(url as Any)
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async { [self] in
                lunchImage.image = UIImage(data: data!)
                //lunchImage.alpha = 0.7
            }
        }
        
       
        self.viewModel = viewModel
        resturantNameLabel.text = viewModel.name
        categoryTypeLabel.text = viewModel.category
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
