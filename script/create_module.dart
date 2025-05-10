import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Usage: dart create_module.dart <parent_dir_name>');
    return;
  }

  // Get the parent directory name from the command-line arguments
  final parentDirName = arguments[0];

  // Define the base path for the `features` directory
  const basePath = 'lib/src/features';

  // Create the base `features` directory if it doesn't exist
  final baseDir = Directory(basePath);
  if (!baseDir.existsSync()) {
    baseDir.createSync(recursive: true);
    print('Created base directory: $basePath');
  }

  // Create the parent directory under `lib/src/features`
  final parentDir = Directory('$basePath/$parentDirName');
  if (!parentDir.existsSync()) {
    parentDir.createSync();
    print('Created parent directory: ${parentDir.path}');
  } else {
    print('Parent directory "${parentDir.path}" already exists.');
  }

  // Create subdirectories
  final subDirs = ['controller', 'model', 'view/widgets'];
  for (var dir in subDirs) {
    final subDir = Directory('${parentDir.path}/$dir');
    if (!subDir.existsSync()) {
      subDir.createSync(recursive: true); // `recursive: true` handles nested dirs
      print('Created subdirectory: ${subDir.path}');
    } else {
      print('Subdirectory "${subDir.path}" already exists.');
    }
  }

  // Create specific files with default content
  createControllerFile(parentDirName, parentDir.path);
  createModelFile(parentDirName, parentDir.path);
  createViewFile(parentDirName, parentDir.path);

  // Add routes and import statements to AppRoutes
  addRoutesToAppRoutes(parentDirName);

  print('Module creation completed under $basePath/$parentDirName.');
}

void createControllerFile(String parentDirName, String parentDirPath) {
  final filePath = '$parentDirPath/controller/${parentDirName}_controller.dart';
  final file = File(filePath);

  if (!file.existsSync()) {
    file.writeAsStringSync(''' 
import 'package:get/get.dart';

class ${toCamelCase(parentDirName)}Controller extends GetxController {
  static ${toCamelCase(parentDirName)}Controller get instance => Get.find();
}
''');
    print('Created controller file: $filePath');
  } else {
    print('Controller file "$filePath" already exists.');
  }
}

void createModelFile(String parentDirName, String parentDirPath) {
  final filePath = '$parentDirPath/model/${parentDirName}_model.dart';
  final file = File(filePath);

  if (!file.existsSync()) {
    file.writeAsStringSync(''' 
// Model for $parentDirName
class ${toCamelCase(parentDirName)}Model {
  // Add fields and methods here
}
''');
    print('Created model file: $filePath');
  } else {
    print('Model file "$filePath" already exists.');
  }
}

void createViewFile(String parentDirName, String parentDirPath) {
  final filePath = '$parentDirPath/view/${parentDirName}_screen.dart';
  final file = File(filePath);

  if (!file.existsSync()) {
    file.writeAsStringSync(''' 
import 'package:flutter/material.dart';
import '../../../common/layouts/layout_with_back_button/layout_with_back_button.dart';

class ${toCamelCase(parentDirName)}Screen extends StatelessWidget {
  const ${toCamelCase(parentDirName)}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppLayoutWithBackButton(
      title: "${toCamelCase(parentDirName)}",
      body: Column(
        children: [],
      ),
    );
  }
}
''');
    print('Created view file: $filePath');
  } else {
    print('View file "$filePath" already exists.');
  }
}

String toCamelCase(String input) {
  return input
      .split('_')
      .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
      .join('');
}

String toLowerCamelCase(String input) {
  final camelCase = toCamelCase(input);
  return camelCase[0].toLowerCase() + camelCase.substring(1);
}

void addRoutesToAppRoutes(String parentDirName) {
  const appRoutesPath = 'lib/src/utils/helpers/routes.dart';
  final appRoutesFile = File(appRoutesPath);

  if (!appRoutesFile.existsSync()) {
    print('❌ AppRoutes file not found at $appRoutesPath');
    return;
  }

  String content = appRoutesFile.readAsStringSync();

  final camelName = toCamelCase(parentDirName);       // E.g., Instructor
  final lowerCamel = toLowerCamelCase(parentDirName); // E.g., instructor

  final importStatement = "import '../../features/$parentDirName/view/${parentDirName}_screen.dart';";
  final routeConst = "static const String ${lowerCamel}Screen = '/${parentDirName.toLowerCase()}_screen';";
  final getPageEntry = "GetPage(name: ${lowerCamel}Screen, page: () => const ${camelName}Screen()),";

  // ✅ Add import if missing
  if (!content.contains(importStatement)) {
    // Add after last import
    final lastImportIndex = content.lastIndexOf(RegExp(r"import .+?;"));
    final insertPos = content.indexOf('\n', lastImportIndex) + 1;
    content = content.replaceRange(insertPos, insertPos, '$importStatement\n');
    print('✅ Added import statement.');
  }

  // ✅ Add route constant if missing
  if (!content.contains(routeConst)) {
    final classIndex = content.indexOf(RegExp(r'class\s+\w+\s*\{'));
    final nextLineIndex = content.indexOf('\n', classIndex) + 1;
    content = content.replaceRange(nextLineIndex, nextLineIndex, '  $routeConst\n');
    print('✅ Added route constant.');
  }

  // ✅ Add GetPage if missing
  final getPagesMatch = RegExp(r'getPages\s*=\s*\[\s*((.|\n)*?)\];').firstMatch(content);
  if (getPagesMatch != null && !getPagesMatch.group(0)!.contains(getPageEntry)) {
    final getPagesStart = getPagesMatch.start;
    final insertionPoint = content.indexOf('[', getPagesStart) + 1;
    content = content.replaceRange(insertionPoint, insertionPoint, '\n    $getPageEntry');
    print('✅ Added GetPage entry.');
  } else if (getPagesMatch == null) {
    print('⚠️ Could not find `getPages` list. Make sure it exists in routes.dart.');
  }

  // 💾 Write updated file
  appRoutesFile.writeAsStringSync(content);
  print('✅ AppRoutes updated successfully.');
}
