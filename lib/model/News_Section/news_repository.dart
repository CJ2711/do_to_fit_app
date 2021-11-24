import 'news.dart';

class NewsRepository {
  static List<News> loadNews(Target target) {
    const allNews = <News>[
      News(
        id: 0,
        target: Target.aumentarMasa,
        title: 'Consejos para aumentar la masa muscular',
        description:
            'Aqui te mostramos las mejores tecnicas para aumentar tu masa musuclar.',
      ),
      News(
        id: 1,
        target: Target.aumentarMasa,
        title: '¿Cansado de usar las mancuernas?',
        description:
            'Aquí te mostramos alternativas a las mancuernas',
      ),
      News(
        id: 2,
        target: Target.aumentarMasa,
        title: 'Fuerte como la maquinaria de construcción',
        description:
            'Sigue estas tecnicas todos los días, te ayudarán mucho.',
      ),
      News(
        id: 3,
        target: Target.aumentarMasa,
        title: 'Alternativas de dietas para aumentar masa',
        description:
            'Comer y comer no es la mejor opción, se inteligente con tus comidas.',
      ),
      
    ];
    if (target == Target.all) {
      return allNews;
    } else {
      return allNews.where((News n) {
        return n.target == target;
      }).toList();
    }
  }
}
