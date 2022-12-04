import 'package:flutter/cupertino.dart';

class Transaction
{
    DateTime date;
    late String from;
    late String to;
    late double num;
    Transaction({required this.from,required this.to,required this.num,required this.date}){}
}

class RecordProvider extends ChangeNotifier
{
  List<Transaction> _records = <Transaction>[
    Transaction(from: "Tom", to: "Jerry", num: 100, date: DateTime.parse("2022-12-05 00:19:00")),
    Transaction(from: "Jerry", to: "Tom", num: 200, date: DateTime.parse("2022-08-05 00:19:00")),
  ];
  int _records_num = 2;

  get records => _records;
  get records_num => _records_num;

  void AddRecord(Transaction record)
  {
    _records.add(record);
    ++_records_num;
    notifyListeners();
  }
}