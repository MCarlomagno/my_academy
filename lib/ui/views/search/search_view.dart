import 'package:flutter/material.dart';
import 'package:my_academy/ui/views/search/search_view_model.dart';
import 'package:stacked/stacked.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
      onModelReady: (model) => model.onModelReady(),
      builder: (context, model, child) {
        return Scaffold(
          body: model.isBusy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  // Let the ListView know how many items it needs to build.
                  itemCount: model.courses.length,
                  // Provide a builder function. This is where the magic happens.
                  // Convert each item into a widget based on the type of item it is.
                  itemBuilder: (context, index) {
                    final item = model.courses[index];
                    return ListTile(
                      title: Text(item.title),
                      subtitle: Text(item.description),
                    );
                  },
                ),
        );
      },
      viewModelBuilder: () => SearchViewModel(),
    );
  }
}
