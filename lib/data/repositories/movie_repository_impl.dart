import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:moviesapp_flutter/data/data_sources/movie_remote_data_source.dart';
import 'package:moviesapp_flutter/data/models/movie_detail_model.dart';
import 'package:moviesapp_flutter/data/models/movie_model.dart';
import 'package:moviesapp_flutter/domain/entities/app_error.dart';
import 'package:moviesapp_flutter/domain/entities/movie_entity.dart';
import 'package:moviesapp_flutter/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, List<MovieModel>>> getTrending() async {
    try {
      final movies = await remoteDataSource.getTrending();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getComingSoon() async {
    try {
      final movies = await remoteDataSource.getComingSoon();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getPlayingNow() async {
    try {
      final movies = await remoteDataSource.getPlayingNow();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getPopular() async {
    try {
      final movies = await remoteDataSource.getPopular();
      return Right(movies);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, MovieDetailModel>> getMovieDetail(int id) async {
    try {
      final movie = await remoteDataSource.getMovieDetail(id);
      return Right(movie);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }
}
