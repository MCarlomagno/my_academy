import 'package:flutter/material.dart';
import 'package:my_academy/app/locator.dart';
import 'package:my_academy/models/course_model.dart';
import 'package:my_academy/services/ui_services/search_view_service.dart';
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
          appBar: AppBar(
            title: Text("Buscar cursos"),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                },
              ),
            ],
          ),
          key: key,
          body: model.isBusy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                  onRefresh: () => model.reload(),
                  child: ListView.builder(
                    itemCount: model.courses.length,
                    itemBuilder: (context, index) {
                      var item = model.courses[index];
                      return Card(
                        elevation: 8.0,
                        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                        child: Container(
                          margin: EdgeInsets.all(15.0),
                          height: 300,
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Flexible(
                                    child: Text(item.title,
                                        style: Theme.of(context).textTheme.headline5,
                                        overflow: TextOverflow.fade,
                                        softWrap: false),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(item.description),
                              ),
                              Container(
                                height: 150,
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: ListView.builder(
                                  // This next line does the trick.
                                  scrollDirection: Axis.horizontal,
                                  itemCount: item.modules.length,
                                  itemBuilder: (context, index) {
                                    var currentClass = item.modules[index];
                                    return Container(
                                        width: 160.0,
                                        child: Card(
                                          child: Column(
                                            children: <Widget>[
                                              Text(currentClass.title),
                                              Text(currentClass.description),
                                            ],
                                          ),
                                        ));
                                  },
                                ),
                              ),
                              RaisedButton(
                                color: Theme.of(context).accentColor,
                                onPressed: () => null,
                                child: Text('Ver'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
        );
      },
      viewModelBuilder: () => SearchViewModel(),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Buscar';

  SearchViewService _searchViewService = locator<SearchViewService>();

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
            ),
          )
        ],
      );
    }

    //Add the search term to the searchBloc.
    //The Bloc will then handle the searching and add the results to the searchResults stream.
    //This is the equivalent of submitting the search term to whatever search service you are using
    // InheritedBlocs.of(context)
    //     .searchBloc
    //     .searchTerm
    //     .add(query);

    _searchViewService.filter(query);

    return Column(
      children: <Widget>[
        //Build the results based on the searchResults stream in the searchBloc
        StreamBuilder(
          stream: _searchViewService.streamToCourses, // InheritedBlocs.of(context).searchBloc.searchResults,
          builder: (context, AsyncSnapshot<List<Course>> snapshot) {
            if (!snapshot.hasData) {
              return Column(
                children: <Widget>[
                  Center(child: CircularProgressIndicator()),
                ],
              );
            } else if (snapshot.data.length == 0) {
              return Column(
                children: <Widget>[
                  Text(
                    "No Results Found.",
                  ),
                ],
              );
            } else {
              var results = snapshot.data;
              return ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  var result = results[index];
                  return ListTile(
                    title: Text(result.title),
                  );
                },
              );
            }
          },
        ),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called everytime the search term changes.
    // If you want to add search suggestions as the user enters their search term, this is the place to do that.
    return Column();
  }
}
