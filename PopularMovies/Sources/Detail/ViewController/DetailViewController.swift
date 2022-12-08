//
//  DetailViewController.swift
//  PopularMovies
//
//  Created by Andre on 06/12/22.
//

import UIKit
import Kingfisher

protocol DetailViewDisplaying: AnyObject {
    func display(viewModel: DetailViewModel)
}

final class DetailViewController: BaseViewController {
    private enum Layout {
        static let imageSize: CGSize = .init(width: 176, height: 235)
        static let imageCornerRadius: CGFloat = 40
        static let defaultMarginLeftAndRight: CGFloat = 24
        static let defaultMarginTopAndBottom: CGFloat = 32
        static let titleFont: UIFont = .systemFont(ofSize: 28, weight: .semibold)
        static let titleColor: UIColor = .white
        static let voteAverageFont: UIFont = .systemFont(ofSize: 16, weight: .semibold)
        static let voteAverageColor: UIColor = .white
        static let descriptionFont: UIFont = .systemFont(ofSize: 14, weight: .light)
        static let descriptionColor: UIColor = .white.withAlphaComponent(0.75)
    }

    private let interactor: DetailInteracting

    init(interactor: DetailInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(useAutoLayout: true)
        label.font = Layout.titleFont
        label.textColor = Layout.titleColor
        label.textAlignment = .center
        return label
    }()

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView(useAutoLayout: true)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = Layout.imageCornerRadius
        imageView.layer.masksToBounds = true
        return imageView
    }()

    private lazy var voteAverageLabel: UILabel = {
        let label = UILabel(useAutoLayout: true)
        label.font = Layout.voteAverageFont
        label.textColor = Layout.voteAverageColor
        label.textAlignment = .center
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel(useAutoLayout: true)
        label.numberOfLines = 0
        label.font = Layout.descriptionFont
        label.textColor = Layout.descriptionColor
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.showMovie()
    }

    override func buildViewHierarchy() {
        super.buildViewHierarchy()
        view.addSubview(titleLabel)
        view.addSubview(avatarImageView)
        view.addSubview(voteAverageLabel)
        view.addSubview(descriptionLabel)
    }

    override func setupConstraints() {
        super.setupConstraints()

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leftAnchor.constraint(
                equalTo: view.leftAnchor,
                constant: Layout.defaultMarginLeftAndRight
            ),
            titleLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Layout.defaultMarginLeftAndRight
            ),

            avatarImageView.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: Layout.defaultMarginTopAndBottom
            ),
            avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: Layout.imageSize.width),
            avatarImageView.heightAnchor.constraint(equalToConstant: Layout.imageSize.height),

            voteAverageLabel.topAnchor.constraint(
                equalTo: avatarImageView.bottomAnchor,
                constant: Layout.defaultMarginTopAndBottom
            ),
            voteAverageLabel.leftAnchor.constraint(
                equalTo: view.leftAnchor,
                constant: Layout.defaultMarginLeftAndRight
            ),
            voteAverageLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Layout.defaultMarginLeftAndRight
            ),

            descriptionLabel.topAnchor.constraint(
                equalTo: voteAverageLabel.bottomAnchor,
                constant: Layout.defaultMarginTopAndBottom
            ),
            descriptionLabel.leftAnchor.constraint(
                equalTo: view.leftAnchor,
                constant: Layout.defaultMarginLeftAndRight
            ),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Layout.defaultMarginLeftAndRight
            )
        ])

        titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        voteAverageLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }

    override  func configureViews() {
        super.configureViews()
    }
}

extension DetailViewController: DetailViewDisplaying {
    func display(viewModel: DetailViewModel) {
        titleLabel.text = viewModel.title
        voteAverageLabel.text = viewModel.voteAverage
        descriptionLabel.text = viewModel.description
        avatarImageView.kf.setImage(with: URL(string: viewModel.imageURL))
    }
}
