
import 'dart:io';

const String collectionProduct = "Product";
const String productFieldId = "productId";
const String productFieldName = "productName";
const String productFieldCategory = "category";
const String productFieldShortDescription = "shortDescription";
const String productFieldLongDescription = "linkDescription";
const String productFieldSalesPrice = "salesPrice";
const String productFieldStock = "stock";
const String productFieldDiscount = "discount";
const String productFieldThumbnail = "thumbnail";
const String productFieldImage = "image";
const String productFieldAvailable = "available";
const String productFieldFeatured = "featured";

class ProductModel{
  String ? productId;
  String ? productName;
  String ? category;
  String ? shortDescription;
  String ? longDescription;
  num salePrice;
  num stock;
  num productDiscount;
  String thumbnailImageUrl;
  List<String>? additionalImages;
  bool available;
  bool featured;

  ProductModel({
      this.productId,
      this.productName,
      this.category,
      this.shortDescription,
      this.longDescription,
      required this.salePrice,
      required this.stock,
      required this.productDiscount,
      required this.thumbnailImageUrl,
      this.additionalImages,
      this.available=true,
      this.featured=false
  });
  Map<String,dynamic> toMap(){
    return <String,dynamic>{
      productFieldId : productId,
      productFieldName : productName,
      productFieldCategory : category,
      productFieldShortDescription : shortDescription,
      productFieldLongDescription : longDescription,
      productFieldDiscount : productDiscount,
      productFieldSalesPrice : salePrice,
      productFieldStock : stock,
      productFieldThumbnail : thumbnailImageUrl,
      productFieldImage : additionalImages,
      productFieldAvailable : available,
      productFieldFeatured : featured,
    };
  }

  factory ProductModel.fromMap(Map<String,dynamic>map)=>ProductModel(
      productId: map[productFieldId],
      productName: map[productFieldName],
      category: map[productFieldCategory],
      shortDescription: map[productFieldShortDescription],
      longDescription: map[productFieldLongDescription],
      salePrice: map[productFieldSalesPrice],
      stock: map[productFieldStock],
      productDiscount: map[productFieldDiscount],
      thumbnailImageUrl: map[productFieldThumbnail],
      additionalImages: map[productFieldImage]!=null ?
          map[productFieldImage] as List<String> : null,
      available: map[productFieldAvailable],
      featured: map[productFieldFeatured]
  );
  


}