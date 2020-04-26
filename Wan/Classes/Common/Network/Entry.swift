//
//  Entry.swift
//  Wan
//
//  Created by Yang on 2020/4/20.
//  Copyright © 2020 Xinzy. All rights reserved.
//


//MARK: - ApiResult
/// ApiResult
struct ApiResult<T>: HandyJSON {
    var data: T! = nil
    var errorCode: Int = 0
    var errorMsg: String = ""
    
    var isSuccess: Bool {
        errorCode == 0
    }
}

//MARK: - 首页Banner
/// 首页Banner
struct Banner: HandyJSON {
    var id: Int = 0
    var desc: String = ""
    var imagePath: String = ""
    var title: String = ""
    var url: String = ""
    var isVisible: Int = 0
    var order: Int = 0
    var type: Int = 0
}

//MARK: - 分类
/// 分类
struct Chapter: HandyJSON {
    var id: Int = 0
    var parentChapterId: Int = 0
    var courseId: Int = 0
    var order: Int = 0
    var visible: Int = 0
    var name: String = ""
    var children: [Chapter] = [Chapter]()
    
    var childrenNames: [String] {
        var names = [String]()
        children.forEach {
            names.append($0.name)
        }
        return names
    }
}

//MARK: - 文章
/// 文章
struct Article: HandyJSON {
    var id: Int = 0
    var title: String = ""
    var chapterId: Int = 0
    var chapterName: String = ""
    var superChapterId: Int = 0
    var superChapterName: String = ""
    var author: String = ""
    var canEdit: Bool = false
    var collect: Bool = false
    var desc: String = ""
    var link: String = ""
    var publishTime: Int = 0
    var envelopePic: String = ""
    
    var fresh: Bool = false
    var type: Int = 0
    var userId: Int = 0
    var visible: Int = 0
    var zan: Int = 0
    
    var displayTitle: String {
        let dict = [
            "&ldquo;" : "“",
            "&rdquo;" : "”",
            "&mdash;" : "-",
            "&nbsp;" : " ",
            "&quot;":"\"",
            "&lt;" : "<",
            "&gt;" : ">",
            "&amp;" : "&",
            "&apos;" : "'",
            "&cent;" : "￠",
            "&pound;" : "£",
            "&yen;" : "¥",
            "&euro;" : "€",
            "&#167;" : "§",
            "&copy;" : "©",
            "&reg;" : "®",
            "&trade;" : "™",
            "&times;" : "×",
            "&divide;" : "÷"
        ]
        return title.replaceAll(dict)
    }
    
    var displayAuthor: String {
        author.isEmpty ? "匿名" : author
    }
    
    /// 是否置顶文章
    var top: Bool {
        type == 1
    }
    
    var category: String {
        superChapterName + " / " + chapterName
    }
    
    var displayTime: String {
        formatTime(millisecond: publishTime)
    }
}

//MARK: - List
/// 列表
struct List<T: HandyJSON>: HandyJSON{
    var curPage: Int = 0
    var offset: Int = 0
    var over: Bool = false
    var pageCount: Int = 0
    var size: Int = 0
    var total: Int = 0
    
    var datas: [T] = [T]()
}