import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ProfileScreenController extends GetxController {
  final ImagePicker picker = ImagePicker();
  final imageFile = Rx<XFile?>(null);
  var logger = Logger();

  Future<void> pickImage() async {
    try {
      imageFile.value = await picker.pickImage(
        source: ImageSource.gallery,
      );
      logger.d(imageFile()?.path);
    } catch (e) {
      logger.e(e);
    }
  }
}
