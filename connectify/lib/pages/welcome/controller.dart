import 'package:chatapp/common/routes/names.dart';
import 'package:chatapp/common/routes/pages.dart';
import 'package:get/get.dart';
import '../../common/store/config.dart';
import '../../pages/welcome/state.dart';
class WelcomeController extends GetxController{
  final state = WelcomeState();
  WelcomeController();

  changePage(int index) async{
    state.index.value = index;
  }

  handleSignIn() async {
    // to save the record that app is already been opened
    await ConfigStore.to.saveAlreadyOpen();
    Get.offAndToNamed(AppRoutes.SIGN_IN);
  }

}