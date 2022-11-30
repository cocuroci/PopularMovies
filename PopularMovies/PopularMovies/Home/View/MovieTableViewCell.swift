//
//  MovieTableViewCell.swift
//  PopularMovies
//
//  Created by Andre on 30/11/22.
//

import UIKit

final class MovieTableViewCell: UITableViewCell, ViewConfiguration {
    private enum Layout {
        static let imageSize: CGSize = .init(width: 90, height: 120)
        static let imageCornerRadius: CGFloat = 18
        static let defaultMarginLeftAndRight: CGFloat = 24
        static let defaultMarginTopAndBottom: CGFloat = 16
        static let mainSpacing: CGFloat = 16
        static let textSpacing: CGFloat = 8
        static let titleFont: UIFont = .systemFont(ofSize: 16, weight: .semibold)
        static let titleColor: UIColor = .white
        static let dateFont: UIFont = .systemFont(ofSize: 14, weight: .semibold)
        static let dateColor: UIColor = .white.withAlphaComponent(0.75)
    }

    private let mainStackView: UIStackView = {
        let stackView = UIStackView(useAutoLayout: true)
        stackView.spacing = Layout.mainSpacing
        stackView.alignment = .center
        return stackView
    }()

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView(useAutoLayout: true)
        imageView.backgroundColor = .red
        imageView.layer.cornerRadius = Layout.imageCornerRadius
        return imageView
    }()

    private let textStackView: UIStackView = {
        let stackView = UIStackView(useAutoLayout: true)
        stackView.spacing = Layout.textSpacing
        stackView.axis = .vertical
        return stackView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel(useAutoLayout: true)
        label.textColor = Layout.titleColor
        label.font = Layout.titleFont
        label.numberOfLines = 2
        return label
    }()

    private let dateLabel: UILabel = {
        let label = UILabel(useAutoLayout: true)
        label.textColor = Layout.dateColor
        label.font = Layout.dateFont
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {
        contentView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(avatarImageView)
        mainStackView.addArrangedSubview(textStackView)
        textStackView.addArrangedSubview(titleLabel)
        textStackView.addArrangedSubview(dateLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Layout.defaultMarginLeftAndRight),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Layout.defaultMarginLeftAndRight),
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Layout.defaultMarginTopAndBottom),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Layout.defaultMarginTopAndBottom),
            avatarImageView.widthAnchor.constraint(equalToConstant: Layout.imageSize.width),
            avatarImageView.heightAnchor.constraint(equalToConstant: Layout.imageSize.height)
        ])
    }

    func configureViews() {
        backgroundColor = .clear
        selectionStyle = .none
    }

    func configure(model: Movie) {
        titleLabel.text = model.title
        dateLabel.text = model.releaseDate
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        dateLabel.text = nil
        avatarImageView.image = nil
    }
}
