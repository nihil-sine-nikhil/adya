mixin Assets {
  static AssetImages get images => AssetImages();
  static AssetLotties get lotties => AssetLotties();
}

class AssetLotties {
  String location = 'assets/lotties';
}

class AssetImages {
  String location = 'assets/images';

  String get logo => '$location/logo_transparent.png';
  String get play => '$location/play.png';
  String get redo => '$location/redo.png';
  String get speed => '$location/speed.png';
}
