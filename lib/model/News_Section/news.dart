enum Target {
  all,
  aumentarMasa,
  mantenerse,
  bajarPeso,
}

class News {
  const News({
    required this.id,
    required this.target,
    required this.title,
    required this.description,
  });

  final int id;
  final Target target;
  final String title;
  final String description;
  
  @override
  String toString() => "$title (id=$id)";
}
