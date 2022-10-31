
const String  orderDiscount = 'discount';
const String  orderVat = 'orderVat';
const String  orderDeliveryCharge = 'deliveryCharge';

class OrderConstantModel {
  num discount;
  num vat;
  num deliveryCharge;

  OrderConstantModel({
    this.discount = 0,
    this.vat = 0,
    this.deliveryCharge = 0,
  });

  Map<String,dynamic> toMap(){

    return <String,dynamic>{
      orderDiscount : discount,
      orderVat : vat,
      orderDeliveryCharge : deliveryCharge
    };
  }

  factory OrderConstantModel.fromMap(Map<String,dynamic>map)=>OrderConstantModel(
    discount: map[orderDiscount],
    vat: map[orderVat],
    deliveryCharge: map[orderDeliveryCharge],
  );

}
