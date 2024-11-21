import 'package:tik_fest/Data/models/network_response.dart';
import 'package:tik_fest/Data/urls/urls.dart';
import 'package:get/get.dart';
import 'package:tik_fest/Data/models/slider_list_model.dart';
import 'package:tik_fest/Data/services/network_caller.dart';

import '../../Data/models/slider_model.dart';




class SliderListController extends GetxController{

  bool _inProgress =false;
  String ? _errorMessage;

  List<SliderModel> _sliderList =[];

  String ? get errorMessage => _errorMessage;

  List<SliderModel> get sliders => _sliderList;
  bool get inProgress => _inProgress;

  Future<bool> getSliderList() async{
    bool isSuccess = false;
    _inProgress =true;
    update();
    final NetworkResponse response =

    await Get.find<NetworkCaller>().getRequest(url: Urls.sliderListUrl);

    if(response.isSuccess){
      isSuccess=true;
      _errorMessage =null;
      _sliderList = SliderListModel.fromJson(response.responseData).sliderList ??[];

    }else{
      _errorMessage =response.errorMessage;

    }
    _inProgress =false;
    update();
    return isSuccess;
  }

}