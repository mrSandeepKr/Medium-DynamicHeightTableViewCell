//
//  DataSet.swift
//  BtnTableViewCellProj
//
//  Created by Sandeep Kumar on 28/08/21.
//

import Foundation

struct DataObject {
    let title: String
    let subtitle: String
}

class DataSet {
    static let data : [DataObject] = [
        DataObject(title: "Please Show Appreciation",
                   subtitle: "Drop a couple claps if you like this"),
        DataObject(title: "Why does Appreciation matter?",
                   subtitle: "It motivates me to keep creating content, and helps improve the reach of the article. It also lets me know wether the quality of the content is decent or not"),
        DataObject(title: "Why am I writing this article?",
                   subtitle: "Right now as of 28th Aug,2021 i dont see any article or stackoverflow answering the question about making the UIlabels dynamically resize programatically. The issue is that we can easily do this with XiB, but the same implementation programatically is not giving the desired affect and the cells wont resize."),
        DataObject(title: "Is there any other way to do this if I dont wannt use a container view",
                   subtitle: "I think there is another way to do this by calculating the number of lines you require and deciding the height appropriately."),
        DataObject(title: "What is the advantage of this method?",
                   subtitle: "Quite a few of the folks complain that they cant use numberOfLines property in UILabel inside a TableViewCell but this shall allow you to do that.")
    ]
}
