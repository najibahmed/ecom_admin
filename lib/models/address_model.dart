
const String addressFieldLine1='Line1';
const String addressFieldLine2='Line2';
const String addressCity='City';
const String addressZipCode='ZipCode';

class AddressModel{

  String addressLine1;
  String ?addressLine2;
  String city;
  String zipcode;

  AddressModel({
      required this.addressLine1,
      this.addressLine2,
      required this.city,
      required this.zipcode
  });
  Map<String,dynamic> toMap(){

    return <String,dynamic>{
      addressFieldLine1 : addressLine1,
      addressFieldLine2 : addressLine2,
      addressCity : city,
      addressZipCode : zipcode
    };
  }

  factory AddressModel.fromMap(Map<String,dynamic>map)=> AddressModel(
      addressLine1: map[addressFieldLine1],
      addressLine2: map[addressFieldLine2],
      city: map[addressCity],
      zipcode: map[addressZipCode]
  );

}