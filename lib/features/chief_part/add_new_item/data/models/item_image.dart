import 'package:image_picker/image_picker.dart';

class ItemImage {
  final String id;
  final XFile file;

  ItemImage({required this.id, required this.file});

  // Helper method to create a unique ID
  static String generateId() =>
      DateTime.now().microsecondsSinceEpoch.toString();
}
