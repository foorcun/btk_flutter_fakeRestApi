import 'package:http/http.dart' as http;
import 'package:http_demo/models/category.dart';

import '../core/utils/json_helper.dart';

class CategoryApi {
  static Future getCategory() async {
    // Uri myUri = Uri.parse("http://localhost:3000/categories");
    // Uri myUri = Uri.parse("http://10.0.2.2:3000/categories");
    Uri myUri = Uri.parse("http://127.0.0.1:3000/categories");

    http.Response response = await http.get(myUri);

    List listJson = JsonHelper.convertResponseToList(response.body);
    print("json list length " + listJson.length.toString());
    print(listJson[0].toString());
    List<Category> categoryList = [];
    for (var i = 0; i < listJson.length; i++) {
      categoryList.add(Category.fromJson(listJson[i]));
      print("asdf");
    }

    return categoryList;

    //return http.get(myUri);
  }
}
