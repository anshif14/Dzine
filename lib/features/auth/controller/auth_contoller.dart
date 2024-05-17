import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xfashion/features/auth/repository/auth_repository.dart';
import 'dart:io';

final authRepositoryController = Provider((ref) => AuthController(authRepository: ref.watch(authRepositoryProvider)));


class AuthController {
  final authRepository _authRepository;
  AuthController({required authRepository authRepository}):
      _authRepository = authRepository;


  getTerms(){

    return _authRepository.getTerms();
  }

  uploadImage(File file){
    return _authRepository.uploadToFirebase(file);
  }


}