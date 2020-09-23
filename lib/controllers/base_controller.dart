import 'package:get/get.dart';

class BaseController extends GetxController {

  int index = 0;
  void setIndex(int setindex){
    index = setindex;
    update();
  }

}