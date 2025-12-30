import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Kullanım: featuregen create <feature_name>');
    exit(1);
  }

  final command = arguments[0];
  if (command == 'create' && arguments.length > 1) {
    final featureName = arguments[1];
    generateFeatureStructure(featureName);
  } else {
    print('Kullanım: featuregen create <feature_name>');
  }
}

void generateFeatureStructure(String featureName) {
  final baseDir = 'lib/features/$featureName';

  final structure = [
    '$baseDir/domain/entities',
    '$baseDir/domain/repositories',
    '$baseDir/data/models',
    '$baseDir/data/sources',
    '$baseDir/presentation/pages',
    '$baseDir/presentation/widgets',
  ];

  for (final path in structure) {
    final dir = Directory(path);
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
      print('Oluşturuldu: $path');
    } else {
      print('Zaten var: $path');
    }
  }
}
