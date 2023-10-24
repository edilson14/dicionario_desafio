import 'package:flutter/material.dart';

class MeaningComponent extends StatelessWidget {
  final List<String> meaning;

  const MeaningComponent({
    super.key,
    required this.meaning,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Meanings',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            itemCount: meaning.length,
            itemBuilder: (_, index) {
              String text = meaning[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text),
                ],
              );
            },
            separatorBuilder: (_, s) {
              return const Divider();
            },
          ),
        ],
      ),
    );
  }
}
