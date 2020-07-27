import 'package:flutter/material.dart';
import 'package:my_academy/app/locator.dart';
import 'package:my_academy/config/app-localizations.dart';
import 'package:my_academy/models/course_model.dart';
import 'package:my_academy/services/ui_services/search_view_service.dart';
import 'package:my_academy/ui/views/search/last-created-course/last_created_course_view.dart';
import 'package:my_academy/ui/views/search/search_view_model.dart';
import 'package:stacked/stacked.dart';

import 'course-on-search-list/course_on_search_list_view.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return ViewModelBuilder<SearchViewModel>.reactive(
      onModelReady: (model) => model.onModelReady(),
      builder: (context, model, child) {
        var localeValues = AppLocalizations.of(context).values;
        return Scaffold(
          appBar: AppBar(
            title: Text(localeValues['search_courses']),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(AppLocalizations.of(context).values),
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
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          localeValues['recommended'],
                          style: theme.textTheme.headline5,
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          height: 250,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: model.recommendedCourses.length,
                            itemBuilder: (context, index) {
                              var item = model.recommendedCourses[index];
                              return CourseOnSearchListView(
                                course: item,
                              );
                            },
                          ),
                        ),
                        Text(
                          localeValues['popular'],
                          style: theme.textTheme.headline5,
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          height: 250,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: model.popularCourses.length,
                            itemBuilder: (context, index) {
                              var item = model.popularCourses[index];
                              return CourseOnSearchListView(
                                course: item,
                              );
                            },
                          ),
                        ),
                        Text(
                          localeValues['last_created'],
                          style: theme.textTheme.headline5,
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          height: 140.0 * 5.0,
                          width: size.width,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              var item = model.lastCourses[index];
                              return LastCreatedCourseView(
                                course: item,
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        );
      },
      viewModelBuilder: () => SearchViewModel(),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate(this.localeValues);

  var localeValues;

  @override
  String get searchFieldLabel => localeValues['search'];

  SearchViewService _searchViewService = locator<SearchViewService>();

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context).copyWith(primaryColor: Colors.white);
    assert(theme != null);
    return theme;
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: Colors.black,
        ),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
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
              AppLocalizations.of(context).values['at_least_three_letters'],
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
                    localeValues['not_results_found'],
                  ),
                ],
              );
            } else {
              var results = snapshot.data;
              return SingleChildScrollView(
                child: Container(
                  height: results.length * 100.0,
                  child: ListView.builder(
                    itemCount: results.length,
                    itemBuilder: (context, index) {
                      var result = results[index];
                      return ListTile(
                        title: Text(result.title),
                      );
                    },
                  ),
                ),
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
