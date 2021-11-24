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

  // String get assetName => '$id-0.jpg';
  // String get assetPackage => 'shrine_images';

  @override
  String toString() => "$title (id=$id)";
}
