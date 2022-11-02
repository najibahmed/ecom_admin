import 'package:cloud_firestore/cloud_firestore.dart';

const String collectionProduct = "Date";
const String timeStampField = 'timeStamp';
const String dayField = 'day';
const String monthField = 'month';
const String yearField = 'year';

class DateModel{
  Timestamp timestamp;
  num day, month, year;

  DateModel({
    required this.timestamp,
    required this.day,
    required this.month,
    required this.year
  });

  Map<String,dynamic> toMap(){

    return <String,dynamic>{
      timeStampField : timestamp,
      dayField : day,
      monthField : month,
      yearField : year

    };
}

  factory DateModel.fromMap(Map<String,dynamic>map)=>DateModel(
      timestamp: map[timeStampField],
      day: map[dayField],
      month: map[monthField],
      year: map[yearField]
  );

}