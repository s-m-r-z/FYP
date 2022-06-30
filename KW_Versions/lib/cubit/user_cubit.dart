import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kw_versions/general_api_state.dart';
import 'package:kw_versions/model/user_model.dart';
import 'package:kw_versions/repository/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({required this.repository}) : super(const UserState()) {
    _userSubscription = repository.streamUsers().listen(updatedUser);
  }

  final UserRepository repository;

  late final StreamSubscription<List<User>> _userSubscription;

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }

  void updatedUser(List<User> users) {
    emit(
      state.copyWith(
        userState: GeneralApiState(
          model: users,
          apiCallState: APICallState.loaded,
        ),
      ),
    );
  }

  Future<void> addUser(User user, String docId) async {
    try {
      await repository.addUser(user, docId);
    } catch (e) {
      emit(
        state.copyWith(
          userState: GeneralApiState(
            model: state.userState.model,
            apiCallState: APICallState.failure,
            errorMessage: e.toString(),
          ),
        ),
      );
    }
  }
}
