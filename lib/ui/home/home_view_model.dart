import 'package:flutter_application_1/data/model/location.dart';
import 'package:flutter_application_1/data/repository/location_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState{
  List<Location> locations;
  HomeState(this.locations);
}

class HomeViewModel extends Notifier<HomeState>{
  @override
  HomeState build() {
    // 최초 상태 리턴
    // 사용자가 처음에 아무런 검색을 하지 않으면 빈 리스트 리턴됨
    return HomeState([]);
  }

  final LocationRepository locationRepo = LocationRepository();
  // 검색해서 상태를 업데이트하는 로직
  void searchLocation(String query) async {
    // 1) LocationRepository 통해서 Location 리스트 받아오기
    final result = await locationRepo.search(query);
    // 2) 상태 업데이트 해주기
    state = HomeState(result);
  }
}

final HomeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(
  () {
    return HomeViewModel();
  },
);