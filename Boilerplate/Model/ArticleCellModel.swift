import Domain

enum ContributerType: Int {
    case member = 1
    case brand
    case salon
    case specialist
}

struct ArticleCellModel {
    var thumbUrl: String?
    var title: String?
    var answerCount: Int64?
    var contributerAvatarUrl: String?
    var contributerName: String?
    var contributerTypeRaw: Int?
    var contributerType: String?
    var contributerOrganization: String?
    var url: String?
    var rank: Int?

    init(article: Article?) {
        self.title = article?.title
        self.thumbUrl = article?.thumbnailImageUrl
        self.answerCount = article?.answerCount
        self.contributerName = article?.contributor?.name
        self.contributerType = article?.contributor?.jobTitle
        self.contributerOrganization = article?.contributor?.affiliation
        self.contributerAvatarUrl = article?.contributor?.imageUrl
        self.url = article?.url
    }
}

extension ArticleCellModel {
    static func dummyArticle() -> ArticleCellModel {
        //create a article using fake data
        var article = ArticleCellModel(article: nil)
        article.thumbUrl = "http://file.vforum.vn/hinh/2016/04/girl-xinh-gai-dep-2016-2.jpg"
        article.title = "「勝負ヘア」で強さ表現…美容師北沢さんにインタビュー"
        article.contributerAvatarUrl = "http://share3s.com/wp-content/uploads/2018/01/H%C3%ACnh-%E1%BA%A3nh-g%C3%A1i-xinh-m%E1%BB%99c-m%E1%BA%A1c-khi%E1%BA%BFn-d%C3%A2n-m%E1%BA%A1ng-chao-%C4%91%E1%BA%A3o-con-tim-16.jpg"
        article.contributerName = "投稿者名1001"

        return article
    }
}

extension ArticleCellModel: Equatable {
    static func == (lhs: ArticleCellModel, rhs: ArticleCellModel) -> Bool {
        return lhs.thumbUrl == rhs.thumbUrl && lhs.title == rhs.title && lhs.answerCount == rhs.answerCount && lhs.contributerAvatarUrl == rhs.contributerAvatarUrl && lhs.contributerName == rhs.contributerName && lhs.contributerType == rhs.contributerType && lhs.url == rhs.url && lhs.contributerOrganization == rhs.contributerOrganization && lhs.rank == rhs.rank && lhs.url == rhs.url
    }
}
