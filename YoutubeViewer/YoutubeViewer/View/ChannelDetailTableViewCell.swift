//
//  ChannelDetailTableViewCell.swift
//  YoutubeViewer
//
//  Created by 石場清子 on 2019/11/01.
//  Copyright © 2019 STV-M025. All rights reserved.
//

import UIKit

class ChannelDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var channelNameLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setLayout(data: ChannelListData) {
        thumbnailImageView.image = UIImage(url: data.imageUrl)
        channelNameLabel.text = data.name
        durationLabel.text = data.duration
    }
    
}
