import 'package:rxdart/rxdart.dart';

class DrawerBloc {
  final _pageController = BehaviorSubject<int>.seeded(0);
  Stream<int> get outPage => _pageController.stream;

  int _currentPage = 0;

  void setPage(int page) {
    if (page == _currentPage) {
      return;
    }
    _currentPage = page;
    _pageController.add(page);
  }

  dispose() {
    _pageController.close();
  }
}
