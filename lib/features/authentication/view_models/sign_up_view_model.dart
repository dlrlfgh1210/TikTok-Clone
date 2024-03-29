import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tiktok/features/authentication/repos/authentication_repo.dart';
import 'package:flutter_tiktok/features/onboarding/interests_screen.dart';
import 'package:flutter_tiktok/features/users/view_models/users_view_model.dart';
import 'package:flutter_tiktok/utils.dart';
import 'package:go_router/go_router.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _autoRepo;

  @override
  FutureOr<void> build() {
    _autoRepo = ref.read(autoRepo);
  }

  Future<void> signUp(BuildContext context) async {
    state = const AsyncValue.loading();
    final form = ref.read(signUpForm);
    final users = ref.read(usersProvider.notifier);
    state = await AsyncValue.guard(() async {
      final userCredential = await _autoRepo.emailSignUp(
        form["email"],
        form["password"],
      );
      await users.createProfile(userCredential);
    });
    if (state.hasError) {
      showFirebaseErrorSnack(context, state.error);
    } else {
      context.goNamed(InterestsScreen.routeName);
    }
  }
}


final signUpForm = StateProvider((ref) => {});

final signUpProvider = AsyncNotifierProvider<SignUpViewModel, void>(
    () => SignUpViewModel(),
);