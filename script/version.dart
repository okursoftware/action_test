import 'dart:io';
import 'dart:convert';

void main() {
  // Konsoldan yeni versiyonu girmesini iste
  stdout.write('Enter the new version: ');
  final newVersion = stdin.readLineSync();

  // Güncellemeleri yapmak için pubspec.yaml dosyasını oku
  final file = File('pubspec.yaml');
  var contents = file.readAsStringSync();

  // pubspec.yaml dosyasındaki version alanını değiştir
  contents = contents.replaceAllMapped(
      RegExp(r'^\s*version:\s*[^\s]+$', multiLine: true),
      (match) => 'version: $newVersion');

  // Güncellenmiş içeriği dosyaya yaz
  file.writeAsStringSync(contents);

  print('Version updated to: $newVersion');
}
