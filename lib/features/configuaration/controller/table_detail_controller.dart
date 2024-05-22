import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TableDetailsController extends GetxController {
  final tablesPerFloors = {'Floor 1': const Text('Floor 1'),'Floor 2' : const Text('Floor 2')};
  final selectedFloor = 'Floor 1'.obs;

  final initialRow = 3.obs;
  final totalTables = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20].obs;

  final sliderValue = 3.0.obs;
  final minSliderValue = 3.0.obs;
  final maxSliderValue = 10.0.obs;
}