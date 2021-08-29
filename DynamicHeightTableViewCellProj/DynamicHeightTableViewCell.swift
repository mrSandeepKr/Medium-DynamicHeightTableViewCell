import UIKit

class DynamicHeightTableViewCell: UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    // MARK: Overrides
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
  
    private func commonInit() {
        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(subtitleLabel)
        
        NSLayoutConstraint.activate(staticConstraints())
    }
    
    //MARK: Elements
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.lineBreakMode = .byTruncatingTail
        // Setting the max number of allowed lines in title to 1
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.lineBreakMode = .byTruncatingTail
        // Setting the max number of allowed lines in sub-title to 3
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let containerView: UIView = {
        // wrapper to contain all the subviews for the UITableViewCell
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private func staticConstraints() -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        
        //Set the constraints of the containerView view to the contentView of the Cell
        constraints.append(contentsOf: [
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        constraints.append(contentsOf: [
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor,
                                            constant: 5.0),
            titleLabel.heightAnchor.constraint(equalToConstant: 18.0),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,
                                                constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
        
        constraints.append(contentsOf: [
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                               constant:4.0),
            subtitleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor,
                                                  constant: -4.0),
            subtitleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,
                                                   constant: 5),
            subtitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
        
        return constraints
    }
    
    //MARK: Public
    // function to configure the cells title and subtitle Text
    func configureCell(with title:String, subtitle:String, image: UIImage? = nil) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
}
