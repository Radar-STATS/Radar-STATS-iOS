//
//  PresentationContainer.swift
//  RadarSTATS
//
//  Original idea by Pedro José Pereira Vieito
//  Created by Jorge Juan Ramos Garnero on 23/09/2020.
//

import Swinject

class PresentationContainer {
    @discardableResult
    init(container: Container) { prepareInjections(container: container) }

    internal func prepareInjections(container: Container) {
        container.register(ChartsRouter.self) { _ in ChartsRouterDefault() }.inObjectScope(.container)
        container.register(ChartsPresenter.self) { _ in ChartsPresenterDefault() }.inObjectScope(.container)
        container.register(ChartsFactory.self) { resolver in
            let factory = ChartsFactoryDefault()
            factory.graphicFormatter = resolver.resolve(ChartGraphicFormatter.self)
            return factory
        }.inObjectScope(.container)
        container.register(ChartGraphicFormatter.self) { _ in ChartGraphicFormatterDefault() }.inObjectScope(.container)

        container.register(ChartInfoRouter.self) { _ in ChartInfoRouterDefault() }.inObjectScope(.container)
        container.register(ChartInfoPresenter.self) { _ in ChartInfoPresenterDefault() }.inObjectScope(.container)

        container.register(AboutRouter.self) { _ in AboutRouterDefault() }.inObjectScope(.container)
        container.register(AboutPresenter.self) { _ in AboutPresenterDefault() }.inObjectScope(.container)
    }
}
