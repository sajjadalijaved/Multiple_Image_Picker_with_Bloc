part of 'image_packer_bloc.dart';

@immutable
 class ImagePackerState {
   final List<XFile>? images;
  ImagePackerState({this.images});

  ImagePackerState copywith({List<XFile>? images}) => ImagePackerState(images: images ?? this.images);
 }

// class ImagePackerInitial extends ImagePackerState {}

// class ImagePickState extends ImagePackerState{
 
// }
