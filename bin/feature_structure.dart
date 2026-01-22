import 'dart:io';

import 'enums/state_enum.dart';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    _printUsage();
    exit(1);
  }

  final command = arguments.first;

  if (command == 'create' && arguments.length >= 2) {
    final featureName = arguments[1];
    final flag = arguments.length > 2 ? arguments[2] : null;
    generateFeatureStructure(featureName, flag: flag);
  } else {
    _printUsage();
  }
}

void generateFeatureStructure(String featureName, {String? flag}) {
  final baseDir = 'lib/features/$featureName';

  final structure = <String>[
    '$baseDir/domain/entities',
    '$baseDir/domain/repositories',
    '$baseDir/data/models',
    '$baseDir/data/services',
    '$baseDir/presentation/screens',
    '$baseDir/presentation/widgets',
  ];

  if (flag == StateEnum.bloc.name) {
    structure.add('$baseDir/presentation/bloc');
  } else if (flag == StateEnum.provider.name) {
    structure.add('$baseDir/presentation/provider');
  } else if (flag == StateEnum.getx.name) {
    structure.add('$baseDir/presentation/controller');
  }

  for (final path in structure) {
    final dir = Directory(path);
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
      print('Created: $path');
    } else {
      print('Already exists: $path');
    }
  }
}

void _printUsage() {
  print('''
Usage:
  feature_structure create <feature_name> [options]

Options:
  --bloc        Create bloc folder under presentation
  --provider    Create provider folder under presentation
  --getx    Create controller folder under presentation

''');
}
