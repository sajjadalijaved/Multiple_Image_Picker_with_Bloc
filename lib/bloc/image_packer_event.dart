part of 'image_packer_bloc.dart';

@immutable
abstract class ImagePackerEvent {}

class SelectMultipleImageEvent extends ImagePackerEvent{
final List<XFile> images;
SelectMultipleImageEvent(this.images); 
}

class UnSelectMultipleImageEvent extends ImagePackerEvent{
  
}
