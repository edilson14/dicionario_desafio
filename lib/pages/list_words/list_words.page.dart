import 'package:dicionario_desafio/components/wordlist_widget.dart';
import 'package:dicionario_desafio/controllers/words_controller.dart';
import 'package:dicionario_desafio/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WordsListPage extends StatelessWidget {
  final WordsController controller = Get.find<WordsController>();
  final _tabs = <Tab>[
    const Tab(
      icon: Icon(Icons.list),
    ),
    const Tab(
      icon: Icon(Icons.history),
    ),
    const Tab(
      icon: Icon(Icons.favorite),
    )
  ];

  WordsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Obx(() => Text(controller.pageTitle)),
          bottom: TabBar(
            onTap: controller.handleTabIndexChange,
            tabs: _tabs,
          ),
        ),
        body: TabBarView(
          children: [
            Obx(
              () => _buildWordsList(
                context,
                words: controller.words,
              ),
            ),
            Obx(
              () => _buildRecentlyWords(context),
            ),
            Obx(
              () => _buildWordsList(
                context,
                words: controller.favorites,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildWordsList(
    BuildContext context, {
    required List<Word> words,
  }) {
    return ListView.builder(
      itemCount: words.length,
      itemBuilder: (_, index) {
        Word word = words[index];
        return WordListItemComponent(
          onTap: () => controller.openDetails(word: word),
          word: word,
          isFavorite: word.favorite,
          handleFavorite: () => controller.handleFavorite(context, word: word),
        );
      },
    );
  }

  _buildRecentlyWords(
    BuildContext context,
  ) {
    return controller.recentWords.isNotEmpty
        ? ListView.builder(
            itemCount: controller.recentWords.length,
            itemBuilder: (_, index) {
              Word word = controller.recentWords[index];
              return InkWell(
                onTap: () => controller.openDetails(word: word),
                child: ListTile(
                  title: Text(word.word),
                  trailing: Icon(
                    color: word.favorite ? Colors.red : null,
                    word.favorite ? Icons.favorite : Icons.favorite_border,
                  ),
                ),
              );
            },
          )
        : const Center(
            child: Text('Nenhuma palavra visualizada recentemente'),
          );
  }
}
