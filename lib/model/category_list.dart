import 'new_model.dart';

List<CategoryModel> getCategories() {
  // List of news categories
  List<String> categoryNames = [
    "General",
    "Business",
    "Science",
    "Sports",
    "Health",
    "Entertainment",
  ];

  // Mapping category names to CategoryModel objects
  List<CategoryModel> categories = categoryNames.map((name) {
    return CategoryModel(categoryName: name);
  }).toList();

  return categories;
}
