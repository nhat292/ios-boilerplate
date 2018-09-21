import UIKit
import RxSwift

class HomeArticleContentCell: BindableTableViewCell<ArticleCellModel> {
    @IBOutlet weak var imageViewThumb: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthorDesc: UILabel!
    @IBOutlet weak var imageViewAuthorAvatar: UIImageView!
    @IBOutlet weak var lblLikeCount: UILabel!
    var disposeBag = DisposeBag()

    override func awakeFromNib() {
        super.awakeFromNib()
        imageViewAuthorAvatar.cornerRadius = imageViewAuthorAvatar.width / 2.0
        imageViewThumb.pin_updateWithProgress = true
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }

    override func bind(data: ArticleCellModel) {
        imageViewThumb.pin_setImage(data.thumbUrl)
        lblTitle.text = data.title
        lblAuthorDesc.showContributorDescription(name: data.contributerName, jobTitle: data.contributerType, affiliation: data.contributerOrganization)
        imageViewAuthorAvatar.pin_setImage(data.contributerAvatarUrl)
        lblLikeCount.text = String("\(data.answerCount ?? 0)")
    }
}
