import 'dart:async';
import 'dart:typed_data';

import 'package:ai_image/feature/prompt/repos/prompt_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'prompt_event.dart';
part 'prompt_state.dart';

class PromptBloc extends Bloc<PromptEvent, PromptState> {
  PromptBloc() : super(PromptInitial()) {
    on<PromptInitialEvent>(promptInitialEvent);
    on<PromptEnteredEvent>(promptEnteredEvent);
  }

  FutureOr<void> promptEnteredEvent(
     PromptEnteredEvent event,  Emitter<PromptState> emit) async {
    emit(PromptGeneratingImageLoadState());
    Uint8List? bytes =await PromptRepo.generateImage(event.prompt);
    if(bytes!=null){
      emit(PromptGeneratingImageSuccessState(bytes));
      print("Loding state works");
    }else{
      emit(PromptGeneratingImageErrorState());
    }
  }


  FutureOr<void> promptInitialEvent(
    PromptInitialEvent event, Emitter<PromptState> emit) async {
  try {
    Uint8List bytes = await rootBundle.load('assets/AI.png').then((byteData) => byteData.buffer.asUint8List());

    emit(PromptGeneratingImageSuccessState(bytes));
  } catch (e) {
    print("Error loading image: $e");
    emit(PromptGeneratingImageErrorState());
  }
}
}
