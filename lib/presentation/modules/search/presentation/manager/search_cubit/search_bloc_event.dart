part of 'search_bloc.dart';

class SearchBlocEvent extends BlocEvent{}

class OnSearchSearchBlocEvent extends SearchBlocEvent{
  final String searchQuery;
  OnSearchSearchBlocEvent(this.searchQuery);
}

class OnSearchPaginationBlocEvent extends SearchBlocEvent{}
