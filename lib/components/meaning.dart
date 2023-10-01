import 'package:flutter/widgets.dart';

class MeaningComponent extends StatelessWidget {
  const MeaningComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Meanings'),
        Row(
          children: [
            Text('Type - '),
            Text('definition'),
          ],
        ),
      ],
    );
  }
}
