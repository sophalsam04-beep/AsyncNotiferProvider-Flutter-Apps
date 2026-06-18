import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:self_learn8/model/user_model.dart';
import 'package:self_learn8/service/api_service.dart';

class UserNotifier extends AsyncNotifier<List<UserModel>> {
  @override
  Future<List<UserModel>> build() async {
    return ApiService().fetchUser();
  }

  Future<void> refreshData() async {
    // state loading
    state = const AsyncLoading();

    // state call guard values

    state = await AsyncValue.guard(() => ApiService().fetchUser());
  }
}
