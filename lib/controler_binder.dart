import 'package:get/get.dart';
import 'package:tik_fest/presentation/state_holder/slider_list_controler.dart';


class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(SliderListController());


  }
}
