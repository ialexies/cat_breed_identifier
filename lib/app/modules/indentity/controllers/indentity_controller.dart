import 'package:cat_breed_identifier/app/data/repository/cat_info.dart';
import 'package:cat_breed_identifier/app/modules/indentity/breed_model.dart';
import 'package:cat_breed_identifier/app/modules/indentity/providers/breed_provider.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'dart:io' as io;

class IndentityController extends GetxController with StateMixin<List<Breed>> {
  BreedProvider _apiProvider = BreedProvider();

  var imageFile = io.File('').obs;
  Rx<io.File>? catImage = io.File('').obs;
  RxString result = ''.obs;
  var imagePicker = ImagePicker().obs;
  RxList<Breed> catBreeds = <Breed>[].obs;
  Rx<Breed> catInfo = Breed().obs;
  // @override
  // void onInit() {
  //   super.onInit();
  //   _apiProvider.fetchProducts().then((response) {
  //     change(response, status: RxStatus.success());
  //   }, onError: (err) {
  //     change(null, status: RxStatus.error(err.toString()));
  //   });
  // }

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
          imageMean: 127.5,
          imageStd: 127.5,
          numResults: 3,
          threshold: 0.5,
          asynch: true);

      recognitions!.forEach((element) {
        result.value = element["label"];
      });
    }

    await _apiProvider.fetchBreeds().then((response) async {
      change(response, status: RxStatus.success());
      catBreeds.value = response;
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });

    if (result != "") {
      List<Breed> selectedBreed =
          // catBreeds.where((o) => o.name == result.value.toString()).toList();
          catBreeds
              .where((o) =>
                  o.name.toString().toLowerCase() ==
                  result.value.toString().toLowerCase())
              .toList();
      selectedBreed.length > 0 ? catInfo.value = selectedBreed[0] : null;

      // catInfo.value =
      print(catInfo.value);
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
