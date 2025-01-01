import 'package:flutter/material.dart';
import 'package:next_nexus_app/Remote/api_manager.dart';
import '../../../../Remote/Sources_Response/Source.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
  bool showLoading = false;
  String? errorMessage;
  List<Source> sources = [];

  getSources(String category) async {
    try {
      errorMessage=null;
      sources=[];
      showLoading = true;
      notifyListeners();
      //call api
      var sourceResponse = await ApiManager.getSources(category);
      showLoading = false;
      if (sourceResponse?.status == "error") {
        //handle logic server error
        errorMessage = sourceResponse?.message;
      } else {
        // handle logic server success
        sources = sourceResponse?.sources ?? [];
      }
      notifyListeners();
    } catch (error) {
      // handle logic client error
      showLoading = false;
      errorMessage = error.toString();
      notifyListeners();

    }

  }
}
