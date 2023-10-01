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
            Obx(() => ListView.builder(
                  itemCount: controller.words.length,
                  itemBuilder: (_, index) {
                    Word word = controller.words[index];
                    return WordListItemComponent(
                      ontap: () => controller.openDetails(word: word),
                      word: word,
                    );
                  },
                )),
            // const Icon(Icons.list),
            const Icon(Icons.history),
            const Icon(Icons.favorite),
          ],
        ),
      ),
    );
  }
}
