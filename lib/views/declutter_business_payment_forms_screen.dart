import 'package:flutter/material.dart';

import '../widgets/previous_page_icon.dart';

class DeclutterBusinessPaymentForms extends StatelessWidget {
  const DeclutterBusinessPaymentForms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: PreviousPageIcon(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Column(
        children: [
          Text("Payment")
        ],
      ),
    );
  }
}
