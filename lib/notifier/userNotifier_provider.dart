import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:self_learn8/model/user_model.dart';
import 'package:self_learn8/notifier/user_notifier.dart';



final userProvider = AsyncNotifierProvider<UserNotifier,List<UserModel>>(UserNotifier.new);