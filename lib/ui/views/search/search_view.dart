import 'package:flutter/material.dart';
import 'package:my_academy/ui/views/search/search_view_model.dart';
import 'package:stacked/stacked.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.nonReactive(
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: Text("SearchView"),
          ),
        );
      },
      viewModelBuilder: () => SearchViewModel(),
    );
  }
}
