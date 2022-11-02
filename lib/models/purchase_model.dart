import 'date_model.dart';

const String collectionProduct = "Purchase";
const String purchaseFieldId='purchaseId';
const String purchaseFieldProductId='productId';
const String purchaseFieldQuantity='purchaseQuantity';
const String purchaseFieldPrice='purchasePrice';
const String purchaseFieldDateModel='dateModel';

class PurchaseModel {
  String? purchaseId;
  String? productId;
  num purchaseQuantity;
  num purchasePrice;
  DateModel dateModel;

  PurchaseModel({
    this.purchaseId,
    this.productId,
    required this.purchaseQuantity,
    required this.purchasePrice,
    required this.dateModel,
  });

  Map<String,dynamic> toMap(){

    return <String,dynamic>{

      purchaseFieldId : purchaseId,
      purchaseFieldProductId : purchaseId,
      purchaseFieldQuantity : purchaseQuantity,
      purchaseFieldPrice : purchasePrice,
      purchaseFieldDateModel : dateModel.toMap(),

    };
  }

  factory PurchaseModel.fromMap(Map<String,dynamic>map)=>PurchaseModel(
      purchaseId: map[purchaseFieldId],
      purchaseQuantity: map[purchaseFieldQuantity],
      purchasePrice: map[purchaseFieldPrice],
      dateModel: DateModel.fromMap(map[purchaseFieldDateModel])
  );
}