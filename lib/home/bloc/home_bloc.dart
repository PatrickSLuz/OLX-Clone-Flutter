import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final _searchController = BehaviorSubject<String>();
  Stream<String> get outSearch => _searchController.stream;

  void setSearch(String search) {
    _searchController.add(search);
  }

  dispose() {
    _searchController.close();
  }
}
