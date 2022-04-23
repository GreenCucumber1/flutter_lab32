import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:teplov_lab2/bloc/event.dart';
import 'package:teplov_lab2/bloc/state.dart';


class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc() : super(InitialState()) {
    on<LoadDataEvent>(_loadData);
   
  }

  Future<void> _loadData(
    LoadDataEvent event,
    Emitter<CharactersState> emit
  ) async {
    try {
      emit(LoadingState());
      final String qwer="https://api.weatherbit.io/v2.0/forecast/daily?lat=${event.url1}1&lon=${event.url2}1&key=5e2805de11cd4b7baad01f51ed9c7a23&include=minutely";
      final url = Uri.parse(qwer);
      await Future.delayed(const Duration(seconds: 1));
      final response = await http.get(url);
      if (response.statusCode != 200) {
        emit(FailedState(errorMessage: response.statusCode.toString()));
      }
      final decodedResponse = jsonDecode(response.body);
      emit(LoadedState(data: decodedResponse));
    } catch (e) {
      emit(FailedState(errorMessage: e.toString()));
    }
  }
}
