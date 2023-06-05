part of 'image_packer_bloc.dart';

@immutable
 class ImagePackerState {
   final List<XFile>? images;
  const ImagePackerState({this.images});

  ImagePackerState copywith({List<XFile>? images}) => ImagePackerState(images: images ?? this.images);

 }


