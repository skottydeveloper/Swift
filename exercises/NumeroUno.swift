enum Edition: String {
  case basic
  case premium
  case ultimate

  mutating func upgrade() {
    switch self {
      case .basic:
        self = .premium
      case .premium:
        self = .ultimate
      case .ultimate:
        print("Can't upgrade further")
    }
  }
}

enum DeliveryMethod {
  case shipping(weight: Int)
  case cloudDigital(isLifetime: Bool)

  var shippingCost : Int {
    switch self {
      case .shipping(let weight):
        return weight * 2
      case .cloudDigital:
        return 0
    }
  }
}

enum ProductType: String, CaseIterable {
    case aceRepository = "Ace Repository"
    case dealForcer = "Deal Forcer"
    case kadencePlanner = "Kadence Planner"
    case mailCannon = "Mail Cannon"
}

func displayProductOfferings() {
    print("There are \(ProductType.allCases.count) products: ")

    for product in ProductType.allCases {
        print(product.rawValue)
    }
}

func sendOrderConfirmation(of productType: ProductType, and edition: Edition, using deliveryMethod: DeliveryMethod) {
  print("Thank you for purchasing the \(edition.rawValue) edition of \(productType.rawValue)")

  switch deliveryMethod {
    case .shipping:
      print("Your order will be shipped to you at a cost of $\(deliveryMethod.shippingCost)")
    case .cloudDigital(let isLifetime):
      if isLifetime {
        print("You have lifetime cloud access")
      } else {
        print("You can access your subscription information on the cloud")
      }
  }
}

displayProductOfferings()

var myEdition = Edition.basic
myEdition.upgrade()

sendOrderConfirmation(of: ProductType.aceRepository, and: myEdition, using: DeliveryMethod.shipping(weight: 1))
