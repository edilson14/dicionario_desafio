>  This is a challenge by [Coodesh](https://coodesh.com/)

# Mobile Challenge 🏅 2023 - Dictionary

- Dicionario contendo segnificado das palavras em ingles consumindo a [API](https://dictionaryapi.dev/)


## Tecnologias Utilizadas
- Framework [Flutter](https://flutter.dev/)
- [Getx](https://pub.dev/packages/get) para gerenciamento de estado e injeção de dependencias e rotas
- [SqFlite](https://pub.dev/packages/sqflite) como banco de dados 


## Como executar
1. Baixar e instalar a versão 3.13.5 do flutter [aqui](https://docs.flutter.dev/release/archive?tab=linux), seguindo as instruções disponibilizadas na pagina
2. Clonar o repositorio
3. Na  raiz do repositorio executar ```flutter pub get```
4. Ainda na raiz com emulador aberto ou celular conetcado executar ```flutter run```
5. Caso tenha algum problema ou duvida como configurar o emulador ou celular ler a [documentação](https://docs.flutter.dev/get-started/install/linux#set-up-your-android-device)


### Observações
-  Foi adicionado uma página para quando a palavra não for encontrada (mensagem que exibe na pagina é a mesma que a api informa)
-  A lógica de historico de palavras foi baseada , somente nas palavras que foram encontradas os segnificados
-  Caso nao exista algum campo nas palavras pesquisada , é mostrado uma mensagem deixando o usuario ciente
-  Os segnificados estão associados com uma preposição
-  Os dados estão sendo salvos usando SqFlite

