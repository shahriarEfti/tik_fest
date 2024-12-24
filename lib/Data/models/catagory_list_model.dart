import 'catagory_model.dart';

class CatagoryListModel {
  String? msg;
  List<CatagoryModel>? catagoryList;

  CatagoryListModel({this.msg, this.catagoryList});

  CatagoryListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      catagoryList = <CatagoryModel>[];
      json['data'].forEach((v) {
        catagoryList!.add(CatagoryModel.fromJson(v));
      });
    }
  }


}

