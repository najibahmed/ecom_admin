import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../models/category_model.dart';
import '../providers/product_provider.dart';
import '../utils/helper_function.dart';

class AddProductPage extends StatefulWidget {
  static const String routeName="/add_product_page";
  const AddProductPage({Key? key}) : super(key: key);

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {

  final _nameController=TextEditingController();
  final _shortDisController=TextEditingController();
  final _longDisController=TextEditingController();
  final _purchaseController=TextEditingController();
  final _discountController=TextEditingController();
  final _salePriceController=TextEditingController();
  final _quantityController=TextEditingController();

  final _formKey=GlobalKey<FormState>();
  String? thumbnailImageUrl;
  CategoryModel? categoryModel;
  DateTime? purchaseDate;
  ImageSource _imageSource = ImageSource.gallery;
  late StreamSubscription<ConnectivityResult> subscription;
  bool _isConnected = true;

  @override
  void initState() {
    isConnectedToInternet().then((value) {
      setState(() {
        _isConnected = value;
      });
    });
    subscription = Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        _isConnected = result == ConnectivityResult.wifi || result== ConnectivityResult.mobile ;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
        actions: [
          IconButton(
            onPressed: _isConnected ? _saveProduct : null,
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              if(!_isConnected)const ListTile(
                tileColor: Colors.red,
                title: Text('No internet connection', style: TextStyle(color: Colors.white),),
              ),
              Consumer<ProductProvider>(
                builder: (context,provider,child)=>DropdownButtonFormField<CategoryModel>(
                    isExpanded:true,
                    hint: const Text('Select Category'),
                    value: categoryModel,
                    validator: (value){
                      if(value==null ){
                        return "Please select ";
                      }
                      return null;
                    },
                    items: provider.categoryList
                        .map((catModel) => DropdownMenuItem(
                        value: catModel,
                        child: Text(catModel.categoryName)))
                        .toList(),

                    onChanged: (value){
                      setState(() {
                        categoryModel=value;
                      });
                    }
                ),
              ),
              //nameController
              TextFormField(
                keyboardType: TextInputType.text,
                controller:_nameController ,
                decoration:const InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.edit),
                  filled: true,
                ) ,
                validator: (value){
                  if(value==null || value.isEmpty){
                    return "Please fill up this field";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10,),
              //shortDiscription
              TextFormField(
                maxLines: 3,
                keyboardType: TextInputType.text,
                controller: _shortDisController,
                decoration:const InputDecoration(
                  labelText: 'shortDiscription',
                  prefixIcon: Icon(Icons.text_fields_sharp),
                  filled: true,
                ) ,
                validator: (value){
                  if(value==null || value.isEmpty){
                    return "Please fill up this field";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10,),
              //longDiscription
              TextFormField(
                maxLines: 3,
                keyboardType: TextInputType.text,
                controller:_longDisController ,
                decoration:const InputDecoration(

                  labelText: 'longDiscription',
                  prefixIcon: Icon(Icons.text_fields),
                  filled: true,
                ) ,
                validator: (value){
                  if(value==null || value.isEmpty){
                    return "Please fill up this field";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10,),
              //Sale price
              TextFormField(
                keyboardType: TextInputType.number,
                controller:_salePriceController ,
                decoration:const InputDecoration(
                  labelText: 'Sale price',
                  prefixIcon: Icon(Icons.money),
                  filled: true,
                ) ,
                validator: (value){
                  if(value==null || value.isEmpty){
                    return "Please fill up this field";
                  }
                  if(num.parse(value)<=0){
                    return "price should be geter then 0";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10,),
              //purchaseprice
              TextFormField(
                keyboardType: TextInputType.number,
                controller:_purchaseController,
                decoration:const InputDecoration(
                  labelText: 'Purchase price',
                  prefixIcon: Icon(Icons.money),
                  filled: true,
                ) ,
                validator: (value){
                  if(value==null || value.isEmpty){
                    return "Please fill up this field";
                  }
                  if(num.parse(value)<=0){
                    return "price should be geter then 0";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10,),
              //Quientity
              TextFormField(
                keyboardType: TextInputType.number,
                controller:_quantityController ,
                decoration:const InputDecoration(
                  labelText: 'quantity',
                  prefixIcon: Icon(Icons.money),
                  filled: true,
                ) ,
                validator: (value){
                  if(value==null || value.isEmpty){
                    return "Please fill up this field";
                  }
                  if(num.parse(value)<=0){
                    return "price should be geter then 0";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10,),
              //Discount
              TextFormField(
                keyboardType: TextInputType.number,
                controller:_discountController ,
                decoration:const InputDecoration(
                  labelText: 'Discount',
                  prefixIcon: Icon(Icons.discount),
                  filled: true,
                ) ,
                validator: (value){
                  if(value==null || value.isEmpty){
                    return "Please fill up this field";
                  }
                  if(num.parse(value)<0){
                    return "price should be negative value";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10,),

              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(onPressed: (){
                      _selectDate();
                    },
                      label: const Text("Select Date"),
                      icon: const Icon(Icons.calendar_month),
                    ),
                    Text(purchaseDate==null? "no date chosen": getFormattedDate(purchaseDate!)),
                  ],
                ),
              ),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      child: thumbnailImageUrl==null? const Icon(Icons.photo,size: 100,):
                      Image.file(File(thumbnailImageUrl!),width: 100,fit: BoxFit.cover,height: 100,),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton.icon(
                            onPressed: (){
                              _imageSource = ImageSource.camera;
                              _getImage();
                            },
                            label: const Text("Open Camera"),
                            icon: const Icon(Icons.camera)),
                        TextButton.icon(
                            onPressed: (){
                              _imageSource = ImageSource.gallery;
                              _getImage();
                            },
                            label: const Text("Open Galary"),
                            icon: const Icon(Icons.photo_album)),
                      ],

                    )

                  ],
                ),
              ),





            ],
          ),
        ),
      ),
    );
  }

  void _selectDate()async {
    final date=await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year-1),
      lastDate: DateTime.now(),
    );
    if(date!=null){
      setState(() {
        purchaseDate=date;
      });
    }
  }

  void _getImage() async {
    final pickImage = await ImagePicker().pickImage(source: _imageSource, imageQuality: 60);
    if(pickImage != null){
      setState((){
        thumbnailImageUrl=pickImage.path;
      });
    }

  }

  void _saveProduct() async{
    if(thumbnailImageUrl == null){
      showMsg(context, 'Please select a product image');
    }
    if(purchaseDate == null){
      showMsg(context, 'Please select purchase date');
    }
    if(_formKey.currentState!.validate()){
      EasyLoading.show(status: 'Please wait');
    }
  }
  @override
  void dispose() {
    _nameController.dispose();
    _shortDisController.dispose();
    _longDisController.dispose();
    _purchaseController.dispose();
    _discountController.dispose();
    _salePriceController.dispose();
    _quantityController.dispose();
    subscription.cancel();
    super.dispose();
  }

}
