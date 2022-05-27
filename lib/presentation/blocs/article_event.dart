abstract class ArticleEvent {}

class ArticleInitial extends ArticleEvent {}

//Event инициирует получение новой порции данных с сервера
class ArticleAddNews extends ArticleEvent {}
