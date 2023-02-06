// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:meta/meta.dart';

part 'image_packer_event.dart';
part 'image_packer_state.dart';

class ImagePackerBloc extends Bloc<ImagePackerEvent, ImagePackerState> {
  ImagePackerBloc() : super(const ImagePackerState()) {
    on<SelectMultipleImageEvent>((_onSelectMultipleImage));
    on<UnSelectMultipleImageEvent>((_unSelectMultipleImage));

  }

  Future<void> _onSelectMultipleImage(SelectMultipleImageEvent event,Emitter<ImagePackerState> emit)async {
        emit(state.copywith(images: event.images));
      }

        Future<void> _unSelectMultipleImage(UnSelectMultipleImageEvent event,Emitter<ImagePackerState> emit)async {
        emit(state.copywith(images: []));
      }
}
