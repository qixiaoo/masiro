import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:masiro/bloc/global/user/user_event.dart';
import 'package:masiro/bloc/global/user/user_state.dart';
import 'package:masiro/data/repository/favorites_repository.dart';
import 'package:masiro/data/repository/masiro_repository.dart';
import 'package:masiro/data/repository/model/user.dart';
import 'package:masiro/data/repository/profile_repository.dart';
import 'package:masiro/data/repository/user_repository.dart';
import 'package:masiro/di/get_it.dart';
import 'package:masiro/misc/cookie.dart';
import 'package:masiro/misc/platform.dart';
import 'package:masiro/misc/toast.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final _logger = getIt<Logger>();
  final _userRepository = getIt<UserRepository>();
  final _masiroRepository = getIt<MasiroRepository>();
  final _profileRepository = getIt<ProfileRepository>();
  final _favoritesRepository = getIt<FavoritesRepository>();

  UserBloc() : super(const UserState()) {
    on<UserInitialized>(_onUserInitialized);
    on<UserSignedIn>(_onUserSignedIn);
    on<UserSwitched>(_onUserSwitched);
  }

  Future<void> _onUserInitialized(
    UserInitialized event,
    Emitter<UserState> emit,
  ) async {
    final userList = await _userRepository.getUserList();
    final currentUser = await _userRepository.getCurrentUser();
    emit(
      state.copyWith(
        userList: userList,
        currentUser: currentUser,
      ),
    );
  }

  Future<void> _onUserSignedIn(
    UserSignedIn event,
    Emitter<UserState> emit,
  ) async {
    final currentUser = state.currentUser;
    if (currentUser == null) {
      return;
    }
    final userId = currentUser.userId;
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final nextCurrentUser = currentUser.copyWith(lastSignInTime: timestamp);
    final List<User> nextUserList = List.from(state.userList);
    final index = nextUserList.indexWhere((user) => user.userId == userId);
    if (index != -1) {
      nextUserList[index] = nextCurrentUser;
    }
    final nextState = state.copyWith(
      userList: nextUserList,
      currentUser: nextCurrentUser,
    );
    await _userRepository.setCurrentUserLastSignInTime(timestamp);
    emit(nextState);
  }

  Future<void> _onUserSwitched(
    UserSwitched event,
    Emitter<UserState> emit,
  ) async {
    final targetUser = event.user;
    emit(state.copyWith(currentUser: targetUser));
  }

  Future<String> signIn() async {
    final msg = await _masiroRepository.signIn();
    add(UserSignedIn());
    return msg;
  }

  /// Logs out the current user.
  /// Returns `true` if a redirect to the login screen is needed.
  Future<bool> logout() async {
    final currentUser = await _userRepository.getCurrentUser();
    if (currentUser == null) {
      _logger.w('''Logout failed because the current user does not exist.''');
      return true;
    }

    final userList = state.userList;
    final filteredUsers = userList.where((u) => u.userId != currentUser.userId);
    final firstUser = filteredUsers.firstOrNull;

    if (firstUser == null) {
      await _userRepository.clearCurrentCookie();
      await resetCookieManager();
      if (isMobilePhone) {
        await clearWebviewCookies();
      }
      await _userRepository.deleteUser(currentUser.userId);
      add(UserInitialized());
      return true;
    } else {
      await _userRepository.switchCurrentUser(firstUser.userId);
      await _userRepository.deleteUser(currentUser.userId);
      _favoritesRepository.setNeedsRefresh(true);
      _profileRepository.setNeedsRefresh(true);
      add(UserInitialized());
      return false;
    }
  }

  Future<void> switchCurrentUser(int userId) async {
    if (userId == state.currentUser?.userId) {
      return;
    }

    final userList = state.userList;
    final user = userList.where((user) => user.userId == userId).firstOrNull;

    if (user == null) {
      _logger.w(
        '''The `UserState.userList` doesn't include a user with id $userId.''',
      );
      return;
    }

    await _userRepository.switchCurrentUser(user.userId);
    _favoritesRepository.setNeedsRefresh(true);
    _profileRepository.setNeedsRefresh(true);
    add(UserSwitched(user: user));
  }

  Future<void> saveCurrentCookieAndUser(List<Cookie> cookies) async {
    try {
      await _userRepository.saveCurrentCookieAndUser(cookies);
      _favoritesRepository.setNeedsRefresh(true);
      _profileRepository.setNeedsRefresh(true);
      add(UserInitialized());
    } catch (e) {
      e.toString().toast();
    }
  }
}
