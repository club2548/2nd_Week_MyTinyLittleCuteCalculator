//
//  TodoTableViewCell.swift
//  MyTodoList_UICoded
//
//  Created by t2023-m0026 on 1/29/24.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    static let reuseIdentifier = "TodoTableViewCell"
    
    var item : TodoListItem?
    var delegate : CreateTodoDelegate?
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    private let descriptionLabel : UILabel = {
        let label = UILabel()
        return label
    }()
    var completeButton = UIButton(type: .custom)
    
    var completeSwitch = UISwitch()

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    func addSubview() {
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(descriptionLabel)
//        self.contentView.addSubview(completeButton)
        self.contentView.addSubview(completeSwitch)
    }
    
    func autoLayoutCell() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 80),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0)
        ])
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5)
        ])
        
//        completeButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            completeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
//            completeButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
//            completeButton.widthAnchor.constraint(equalToConstant: 30 * 1.5),
//            completeButton.heightAnchor.constraint(equalToConstant: 30 * 1.5)
//        ])
        
        completeSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            completeSwitch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            completeSwitch.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0),
        ])
    }
    
    func setTableViewCell(title: String?, description: String?) {
        titleLabel.text = title
        descriptionLabel.text = description
        addSubview()
        autoLayoutCell()
        setCompleteSwitch()
        updateChecked()
    }
        
    private func updateChecked() {
        let attrituedString = NSMutableAttributedString(string: titleLabel.text ?? "")
        
        if completeSwitch.isOn {
            attrituedString.addAttribute(.strikethroughStyle,
                                         value: 2,
                                         range: NSMakeRange(0,attrituedString.length))
        } else {
            attrituedString.addAttribute(.strikethroughStyle,
                                         value: 0,
                                         range: NSMakeRange(0,attrituedString.length))
        }
        titleLabel.attributedText = attrituedString
    }
    
    private func saveItemIsCompleted() {
        guard let item = item else { return }
        delegate?.updateComplete(item: item, isCompleted: completeSwitch.isOn)
        NotificationCenter.default.post(name: NSNotification.Name("DataUpdated"), object: nil)
    }
    
    @objc func completeSwitchValueChanged(_ sender: UISwitch) {
        updateChecked()
        saveItemIsCompleted()
    }
    
    // completeButton을 눌렀을 때의 동작
    private func setCompleteSwitch() {
        completeSwitch.addTarget(self, action: #selector(completeSwitchValueChanged(_:)), for: .valueChanged)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        completeSwitch.removeTarget(self, action: nil, for: .allEvents)
    }
}
