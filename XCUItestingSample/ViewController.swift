//
//  ViewController.swift
//  XCUItestingSample
//
//  Created by Kukreja, Chirag on 12/03/20.
//  Copyright © 2020 Paypal. All rights reserved.
//

import UIKit

struct Currency: Hashable {
    let type: String
    let value: Double
    let symbol: String
    let flag: String
}
class ViewController: UIViewController {

    @IBOutlet weak var baseCurrencyImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var baseCurrencyType: UILabel!
    @IBOutlet weak var baseCurrenvyTitle: UILabel!
    
    var originalData: [Currency]!
    var baseCurrency: Currency!
    var dataSource = [Currency]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let curr1 = Currency(type: "United States Dollar", value: 70.0, symbol: "$", flag: "🇺🇸")
        let curr2 = Currency(type: "Canada Dollar", value: 50.0,symbol: "A$", flag: "🇨🇦")
        let curr3 = Currency(type: "Singapore Dollar", value: 52.0, symbol: "S$", flag: "🇸🇬")
        let curr4 = Currency(type: "Euro", value: 81.5, symbol: "€", flag:"🇦🇹")
        originalData = [curr1,curr2, curr3, curr4]
        
        baseCurrency = curr1
        dataSource = originalData.difference(from: baseCurrency)
        tableView.register(SubtitleTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.accessibilityLabel = "table"
        reloadBaseCurrency()
    }


    private func reloadBaseCurrency() {
        baseCurrencyType.text = baseCurrency.type
        baseCurrencyImageView.image = baseCurrency.flag.image()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let currency = dataSource[indexPath.row]
        cell.imageView?.image = currency.flag.image()
        cell.textLabel?.text = currency.type
        
        if let am = amount.text {
            cell.detailTextLabel?.text = String(format: "%@ %.2f",
            currency.symbol, (Double(am)! * baseCurrency.value)/currency.value)
        }
        
        return cell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        baseCurrency = dataSource[indexPath.row]
        dataSource = originalData.difference(from: baseCurrency)
        tableView.reloadData()
        reloadBaseCurrency()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

extension Array where Element: Hashable {
    func difference(from other: Element) -> [Element] {
        let thisSet = Set(self)
        let otherSet: Set = [other]
        return Array(thisSet.symmetricDifference(otherSet))
    }
}

class SubtitleTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
