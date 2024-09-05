import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ProfileScreenController extends GetxController {
  final ImagePicker picker = ImagePicker();
  XFile? imageFile;
  var logger = Logger();

  Future<void> pickImage() async {
    try {
      imageFile = await picker.pickImage(
        source: ImageSource.gallery,
      );
    } catch (e) {
      logger.e(e);
    }
  }
}
