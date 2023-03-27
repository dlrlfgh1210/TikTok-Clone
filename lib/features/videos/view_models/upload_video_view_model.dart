import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tiktok/features/authentication/repos/authentication_repo.dart';
import 'package:flutter_tiktok/features/videos/repos/videos_repo.dart';

class UploadVideoViewModel extends AsyncNotifier<void> {
  late final VideosRepository _repository;
  
  @override
  FutureOr<void> build() {
   _repository = ref.read(videosRepo);
  }

  Future<void> uploadVideo(File video) async {
    final user = ref.read(autoRepo).user;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.uploadVideoFile(
        video,
        user!.uid,
      );
    });
  }
}