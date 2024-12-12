import 'dart:io';

import 'package:clone_chat/core/themes/styles.dart';
import 'package:clone_chat/features/status/presentation/views/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class AddNewStatusBody extends StatefulWidget {
  const AddNewStatusBody({super.key});

  @override
  State<AddNewStatusBody> createState() => _AddNewStatusBodyState();
}

class _AddNewStatusBodyState extends State<AddNewStatusBody> {
  File? selectedImage;
  File? selectedVideo;
  VideoPlayerController? videoPlayerController;

  selectImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imageGellery =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (imageGellery != null) {
      setState(() {
        selectedImage = File(imageGellery.path);
        selectedVideo = null;
        videoPlayerController?.dispose();
      });
    }
  }

  selectVideo() async {
    final ImagePicker picker = ImagePicker();
    final XFile? vedioGellery = await picker.pickVideo(
      source: ImageSource.gallery,
    );
    if (vedioGellery != null) {
      setState(() {
        selectedVideo = File(vedioGellery.path);
        selectedImage = null;
        videoPlayerController = VideoPlayerController.file(selectedVideo!);
        videoPlayerController?.initialize();
        videoPlayerController?.play();
      });
    }
  }

  openCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imageGellery =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 80);
    if (imageGellery != null) {
      setState(() {
        selectedImage = File(imageGellery.path);
        selectedVideo = null;
        videoPlayerController?.dispose();
      });
    }
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      // appBar: AddNewStatusAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            selectedImage != null || selectedVideo != null
                ? selectedVideo != null
                    ? InkWell(
                        onTap: () {
                          if (videoPlayerController!.value.isPlaying) {
                            videoPlayerController!.pause();
                          } else {
                            videoPlayerController!.play();
                          }
                        },
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.7,
                          width: double.infinity,
                          child: VideoPlayer(videoPlayerController!),
                        ),
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height * 0.8,
                        width: double.infinity,
                        child: Image.file(selectedImage!, fit: BoxFit.cover),
                      )
                : Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Select Image or Video',
                        style: Styles.textStyle24,
                      ),
                    ),
                  ),
            const Spacer(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomTextButton(
                    onPressed: () {
                      selectImage();
                    },
                    text: 'Upload from Gallery',
                  ),
                  CustomTextButton(
                    onPressed: () {
                      openCamera();
                    },
                    text: "open Camera",
                  ),
                  CustomTextButton(
                    onPressed: () {
                      selectVideo();
                    },
                    text: "Select Video",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
