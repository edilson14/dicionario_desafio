import 'package:flutter/material.dart';
import 'package:dicionario_desafio/models/models.dart';

class WordListItemComponent extends StatelessWidget {
  final Word word;
  final VoidCallback onTap;
  final VoidCallback handleFavorite;
  final bool isFavorite;

  const WordListItemComponent({
    super.key,
    required this.onTap,
    required this.word,
    required this.isFavorite,
    required this.handleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        title: Text(word.word),
        trailing: IconButton(
          icon: Icon(
            color: isFavorite ? Colors.red : Colors.grey,
            isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
          ),
          onPressed: handleFavorite,
        ),
      ),
    );
  }
}
