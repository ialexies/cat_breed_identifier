import 'dart:io' as io;

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class HomeController extends GetxController {
  var imageFile = io.File('').obs;
  Rx<io.File>? catImage = io.File('').obs;
  RxString result = ''.obs;
  var imagePicker = ImagePicker().obs;

  loadDataModelFiles() async {
    String? output = await Tflite.loadModel(
        model: "assets/model_unquant.tflite",
        labels: "assets/labels.txt",
        numThreads: 1,
        isAsset: true,
        useGpuDelegate: false);
    // print(output);
    update();
  }

  doImageClassification() async {
    if (catImage?.value != null) {
      var recognitions = await Tflite.runModelOnImage(
          path: catImage!.value.path,
          imageMean: 0.0,
          imageStd: 255.0,
          numResults: 2,
          threshold: 0.1,
          asynch: true);

      recognitions!.forEach((element) {
        print(element.toString());
        result.value = element["label"];
      });
    }
    update();
  }

  selectPhoto() async {
    result.value = "";
    if (catImage?.value != null) {
      XFile? pickedFile =
          await imagePicker.value.pickImage(source: ImageSource.gallery);
      catImage!.value = io.File(pickedFile!.path);

      catImage;
      doImageClassification();
      update();
    }
  }

  capturePhoto() async {
    if (catImage?.value != null) {
      XFile? pickedFile =
          await imagePicker.value.pickImage(source: ImageSource.camera);
      catImage!.value = io.File(pickedFile!.path);

      catImage;
      doImageClassification();
    }
    update();
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    imagePicker.value = ImagePicker();
    loadDataModelFiles();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
