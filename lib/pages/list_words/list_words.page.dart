import 'package:dicionario_desafio/components/wordlist.widget.dart';
import 'package:dicionario_desafio/controllers/words.controller.dart';
import 'package:dicionario_desafio/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WordsListPage extends StatelessWidget {
  final WordsController controller = Get.find<WordsController>();

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
            tabs: const [
              Tab(
                icon: Icon(Icons.list),
              ),
              Tab(
                icon: Icon(Icons.history),
              ),
              Tab(
                icon: Icon(Icons.favorite),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Obx(
              () => ListView.builder(
                itemCount: controller.words.length,
                itemBuilder: (_, index) {
                  Word word = controller.words[index];
                  return WordListItemComponent(
                    handleFavorite: () =>
                        controller.handleFavorite(context, word: word),
                    ontap: () => controller.openDetails(word: word),
                    isFavorite: word.favorite,
                    word: word,
                  );
                },
              ),
            ),
            Obx(
              () => ListView.builder(
                itemCount: controller.recentWords.length,
                itemBuilder: (_, index) {
                  Word word = controller.recentWords[index];
                  return controller.recentWords.isEmpty
                      ? const Center(
                          child:
                              Text('nenhuma palavra visualizada recentemente'),
                        )
                      : InkWell(
                          onTap: () => controller.openDetails(word: word),
                          child: ListTile(
                            title: Text(word.word),
                            trailing: Icon(
                              color: word.favorite ? Colors.red : null,
                              word.favorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                            ),
                          ),
                        );
                },
              ),
            ),
            // const Icon(Icons.history),
            Obx(
              () => ListView.builder(
                itemCount: controller.favorites.length,
                itemBuilder: (_, index) {
                  Word word = controller.favorites[index];
                  return WordListItemComponent(
                    ontap: () => controller.openDetails(word: word),
                    word: word,
                    isFavorite: true,
                    handleFavorite: () =>
                        controller.handleFavorite(context, word: word),
                  );
                },
              ),
            ),
            // const Icon(Icons.favorite),
          ],
        ),
      ),
    );
  }
}
