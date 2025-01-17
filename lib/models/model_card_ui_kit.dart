class ModelCardUIKit{
  String name;
  String imagePath;
  String description;
  bool viewSelected;

  ModelCardUIKit({
    required this.name,
    required this.imagePath,
    required this.description,
    required this.viewSelected,
});

  static List<ModelCardUIKit> getUICard(){
    List<ModelCardUIKit> cards = [];

    cards.add(
      ModelCardUIKit(
          name: 'Мелиорация',
          imagePath: 'assets/img/screen_melio.jpg',
          description: 'UI-kit проекта мобильной версии мелиорации',
          viewSelected: false),
    );
    cards.add(
      ModelCardUIKit(
          name: 'ЭПК',
          imagePath: 'assets/img/screen.png',
          description: 'UI-kit проекта мобильной версии ЭПК',
          viewSelected: false),
    );
    cards.add(
      ModelCardUIKit(
          name: 'Семеноводство',
          imagePath: 'assets/img/screen.png',
          description: 'UI-kit проекта мобильной версии семеноводства',
          viewSelected: false),
    );
    cards.add(
      ModelCardUIKit(
          name: '30М',
          imagePath: 'assets/img/screen.png',
          description: 'UI-kit проекта мобильной версии 30М',
          viewSelected: false),
    );

    return cards;
  }

}