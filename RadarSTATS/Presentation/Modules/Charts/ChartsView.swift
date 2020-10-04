//
//  ChartsView.swift
//  RadarSTATS
//
//  Original idea by Pedro José Pereira Vieito
//  Created by Jorge Juan Ramos Garnero on 24/09/2020.
//

import UIKit

protocol ChartsView: Loadable, Noticeable {
    var presenter: ChartsPresenter! { get set }

    func update(using localization: Localization)
    func update(using stats: Stats)
}

class ChartsViewController: UIViewController, ChartsView {
    var loadingView: UIView?

    var presenter: ChartsPresenter!

    @IBOutlet private weak var summarySegmented: UISegmentedControl!
    @IBOutlet private weak var summaryStackView: SummaryStackView!
    @IBOutlet private weak var chartsTable: ChartsTableView!

    private let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        presenter.gatherLocalization()
        chartsTable.actionDelegate = self
        chartsTable.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        chartsTable.alpha = 0.0
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.gatherStats()
    }

    func update(using localization: Localization) {
        chartsTable.update(localization: localization.charts)
    }

    func update(using stats: Stats) {
        summarySegmented.setTitle("Hoy, \(stats.formattedExtrationDate(style: .medium))", forSegmentAt: 0)
        summaryStackView.update(using: stats)
        chartsTable.update(modelset: stats)
        UIView.animate(withDuration: 0.5) { self.chartsTable.alpha = 1.0 }
    }

    @objc func refresh(_ refreshControl: UIRefreshControl) {
        UIView.animate(withDuration: 0.5) {
            self.chartsTable.alpha = 0.0
        } completion: { (completed) in
            if completed {
                self.presenter.gatherStats()
            }
        }
    }

    @IBAction func didChangeSummarySegmented(_ sender: UISegmentedControl) {
        guard let summaryMode = SummaryMode(rawValue: sender.selectedSegmentIndex) else { return }
        summaryStackView.layout(mode: summaryMode)
    }
}

extension ChartsViewController: ChartsTableViewActionDelegate {
    func showInformationAbout(chartType: ChartType) {
        presenter.presentInfo(for: chartType)
    }

    func tableViewDidCompleteRefreshing(_ tableView: ChartsTableView) {
        refreshControl.endRefreshing()
    }
}
