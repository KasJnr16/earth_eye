class PricingCalculator {
  PricingCalculator._();

//Total Price based on task and Shipping
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    double shippingCost = getShippingCost(location);

    double totalprice = productPrice + taxAmount + shippingCost;
    return totalprice;
  }

//Calculate shipping cost
  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

//Calculate tax
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    //I'll implement taxes based on location later
    //if else should do
    return 0.10;
  }

  static double getShippingCost(String location) {
    //same
    return 5.00;
  }
}
