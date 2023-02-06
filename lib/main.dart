import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker_with_bloc/bloc/image_packer_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ImagePackerBloc>(
          create: (context) => ImagePackerBloc(),
        )
      ],
      child: MaterialApp(
        title: 'Multiple Image Picker With Bloc',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Multiple Image Picker With Bloc'),
      ),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  String title;
  MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    ImagePackerBloc imagePackerBloc =
        Provider.of<ImagePackerBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: Center(
        child: InkWell(
          onTap: () async {
            final ImagePicker picker = ImagePicker();
            final List<XFile> images = await picker.pickMultiImage();

            imagePackerBloc.add(SelectMultipleImageEvent(images));
          },
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 200,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12)),
            child: BlocBuilder<ImagePackerBloc, ImagePackerState>(
                builder: (context, state) => state.images != null
                    ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                        itemCount: state.images!.length,
                        itemBuilder: (context, index) => Container(
                          height: 100,
                          width: 120,
                          margin: const EdgeInsets.only(left: 3,right: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: FileImage(
                                File(state.images![index].path),
                              ),
                              fit: BoxFit.cover
                            ),
                            
                          ),
                        ),
                      )
                    : const Icon(
                        Icons.photo_camera,
                        size: 80,
                        color: Colors.grey,
                      )),
          ),
        ),
      ),
    );
  }
}
