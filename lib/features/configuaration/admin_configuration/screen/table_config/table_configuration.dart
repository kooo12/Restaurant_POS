import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restruant_pos/features/configuaration/admin_configuration/screen/table_details/table_detail_configuration.dart';
import 'package:restruant_pos/utils/constant/colors.dart';

class TableConfiguration extends StatelessWidget {
  const TableConfiguration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Center(
          child: SizedBox(
            width: 200,
            child: ElevatedButton(
              onPressed: () =>
                  Get.to(() => const TableDetailConfiguration()),
              child: const Text('Table Details'),
            ),
          ),
        ),
        Positioned(
            bottom: 8,
            left: 8,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.info_rounded,
                  color: TpsColors.secondary,
                  size: 40,
                )))
      ]),
    );
  }
}
