import Foundation

/** 記事を表すメディアタイプ (small view) */

public struct Article: Codable {

    /** 回答数 */
    public var answerCount: Int64?
    /** 投稿者所属 */
    public var contributor: Contributor?
    /** ラベル */
    public var label: String?
    /** いいね数 */
    public var likeCount: Int64?
    /** TMSの裏タグ */
    public var metaTag: [MetaTag]?
    /** 公開日 ※RFC3339形式 */
    public var publishedAt: String?
    /** サムネイル画像 */
    public var thumbnailImageUrl: String?
    /** タイトル */
    public var title: String?
    /** 遷移先URL */
    public var url: String?

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {

        var container = encoder.container(keyedBy: String.self)

        try container.encodeIfPresent(answerCount, forKey: "answer_count")
        try container.encodeIfPresent(contributor, forKey: "contributor")
        try container.encodeIfPresent(label, forKey: "label")
        try container.encodeIfPresent(likeCount, forKey: "like_count")
        try container.encodeIfPresent(metaTag, forKey: "meta_tag")
        try container.encodeIfPresent(publishedAt, forKey: "published_at")
        try container.encodeIfPresent(thumbnailImageUrl, forKey: "thumbnail_image_url")
        try container.encodeIfPresent(title, forKey: "title")
        try container.encodeIfPresent(url, forKey: "url")
    }

    // Decodable protocol methods

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: String.self)

        answerCount = try? container.decode(Int64.self, forKey: "answer_count")
        contributor = try? container.decode(Contributor.self, forKey: "contributor")
        label = try? container.decode(String.self, forKey: "label")
        likeCount = try? container.decode(Int64.self, forKey: "like_count")
        metaTag = try? container.decode([MetaTag].self, forKey: "meta_tag")
        publishedAt = try? container.decode(String.self, forKey: "published_at")
        thumbnailImageUrl = try? container.decode(String.self, forKey: "thumbnail_image_url")
        title = try? container.decode(String.self, forKey: "title")
        url = try? container.decode(String.self, forKey: "url")
    }
}

extension Article: Equatable {
    public static func == (lhs: Article, rhs: Article) -> Bool {
        return lhs.answerCount == rhs.answerCount && lhs.contributor == rhs.contributor && lhs.label == rhs.label && lhs.likeCount == rhs.likeCount && lhs.metaTag == rhs.metaTag && lhs.publishedAt == rhs.publishedAt && lhs.thumbnailImageUrl == rhs.thumbnailImageUrl && lhs.title == rhs.title && lhs.url == rhs.url
    }
}
