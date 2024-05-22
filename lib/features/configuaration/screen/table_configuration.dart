import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restruant_pos/features/configuaration/screen/table_detail_configuration.dart';

class TableConfiguration extends StatelessWidget {
  const TableConfiguration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200,
          child: ElevatedButton(
            onPressed: () => Get.to(() => const TableDetailConfiguration()),
            child: const Text('Table Details'),
          ),
        ),
      ),
    );
  }
}
