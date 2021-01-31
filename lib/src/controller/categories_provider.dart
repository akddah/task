import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:for_job/src/model/categoris_model.dart';
import 'package:for_job/src/repo/networkUtil.dart';

class CategoriesProvider extends ChangeNotifier {
  NetworkUtil _util = NetworkUtil();
  AllCategorisModel _model;
  List<Category> categoriesList = [];
  bool loading = false;
  getCategories() async {
    print("starting get categoris");
    loading = true;

    Map<String, String> headers = {};

    Response response =
        await _util.get("categories?type=services", headers: headers);

    if (response == null) {
      print("no internet");
      loading = false;
      notifyListeners();
    } else {
      _model = AllCategorisModel.fromJson(response.data);
      if (_model.message == "success") {
        print("get all categoris sucss");

        // for more items //
        for (var i = 0; i < 4; i++) {
          categoriesList.addAll(_model.data);
        }

        // categoriesList = _model.data; // for act data in api
        loading = false;
        notifyListeners();
      } else {
        print("no categoris");
        loading = false;
        categoriesList.clear();
        notifyListeners();
      }
    }
  }
}
