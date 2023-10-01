import 'package:dicionario_desafio/models/models.dart';
import 'package:flutter/material.dart';

class WordListItemComponent extends StatelessWidget {
  final Word word;
  final VoidCallback ontap;
  const WordListItemComponent({
    super.key,
    required this.ontap,
    required this.word,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: ListTile(
        title: Text(word.word),
        trailing: const Icon(Icons.favorite_border_outlined),
      ),
    );
  }
}
