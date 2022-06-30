part of 'user_cubit.dart';

class UserState extends Equatable {
  const UserState({
    this.userState = const GeneralApiState(),
    this.lastDeletedUser,
  });

  final GeneralApiState<List<User>> userState;
  final User? lastDeletedUser;

  UserState copyWith({
    GeneralApiState<List<User>>? userState,
    User? lastDeletedUser,
  }) {
    return UserState(
      userState: userState ?? this.userState,
      lastDeletedUser: lastDeletedUser ?? this.lastDeletedUser,
    );
  }

  @override
  List<Object?> get props => [userState, lastDeletedUser];
}
