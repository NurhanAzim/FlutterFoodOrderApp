class User {
  static const paymentOnline = 'Online Banking';
  static const paymentCard = 'Credit/Debit Card';
  static const paymentCOD = 'Cash On Delivery';

  String? name = '';
  String? email = '';
  String? address = '';
  Map<String, bool> paymentMethods = {
    paymentOnline: false,
    paymentCard: false,
    paymentCOD: false,
  };
  bool saveInfo = false;

  save() {
    print('Data tempahan berjaya dimuat');
  }
}
