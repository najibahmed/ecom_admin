const String currencySymbol = '৳';
//eta amar...don't use, use ur own key
const serverKey = "AAAAKs2Zd9E:APA91bGo9tGYQ_yhXoljdUl7-EJgSdepS-m38FhWSCcwuKK8_a5t6nZq6GRoYZM6io-Gv4qQqujsjnYPXCbvmtbHlKzvCPXNi4cLCeEJM8iNQbmL2P7bQx0WeURMNsVYqzVtGNnpmEfR";
const cities = [
  'Dhaka',
  'Chittagong',
  'Rajshahi',
  'Khulna',
  'Barishal',
  'Sylhet',
  'Comilla',
  'Noakhali',
  'Faridpur',
  'Rangpur',
  'Gopalgonj'
];

abstract class OrderStatus {
  static const String pending = 'Pending';
  static const String processing = 'Processing';
  static const String delivered = 'Delivered';
  static const String cancelled = 'Cancelled';
  static const String returned = 'Returned';
}

abstract class PaymentMethod {
  static const String cod = 'Cash on Delivery';
  static const String online = 'Online Payment';
}

abstract class NotificationType {
  static const String comment = 'New Comment';
  static const String order = 'New Order';
  static const String user = 'New User';
}
