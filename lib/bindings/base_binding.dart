import 'package:expense_app/controllers/base_controller.dart';
import 'package:expense_app/controllers/data/data_controller.dart';
import 'package:get/get.dart';


class AllBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<BaseController>(BaseController(), permanent: true);
    Get.put<DataController>(DataController(), permanent: true);
  }
}