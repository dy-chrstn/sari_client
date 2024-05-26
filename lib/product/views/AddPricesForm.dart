import 'package:flutter/material.dart';

import '../../common/utils/theme/colors.dart';

class PricesForm extends StatefulWidget {
  final String userId;
  final dynamic fields;
  const PricesForm({super.key, required this.userId, required this.fields});

  @override
  State<PricesForm> createState() => _PricesFormState();
}

class _PricesFormState extends State<PricesForm> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Prices Form'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        backgroundColor: AppColors.backgroundColor,
        body: Center(
          child: Text(widget.fields.name),
        ),
      ),
    );
  }
}
