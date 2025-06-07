import 'package:flutter_clean_arquitecture/src/common/network/api/local_api_client.dart';
import 'package:injectable/injectable.dart';
import 'notes_local_datasource.dart';

class NotesLocalDatasourceImplements implements NotesLocalDatasource{
  @override
  Future<void> decrementFavouriteCount() {
    // TODO: implement decrementFavouriteCount
    throw UnimplementedError();
  }

  @override
  Future<void> incrementFavouriteCount() {
    // TODO: implement incrementFavouriteCount
    throw UnimplementedError();
  }

}