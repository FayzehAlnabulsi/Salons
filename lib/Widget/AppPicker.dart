import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_app_file/open_app_file.dart';
import 'package:path/path.dart' as Path;
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'AppColor.dart';
import 'AppConstants.dart';
import 'AppDialog.dart';
import 'AppIcons.dart';
import 'AppMessage.dart';
import 'AppSize.dart';
import 'AppSnackBar.dart';

class AppPicker extends StatelessWidget {
  final String imageFile;

  const AppPicker({
    Key? key,
    required this.imageFile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }

  static Future<File?> getImage({required context, required imageFile}) async {
    XFile? pickedFile;
    File? file;
    final Directory directory = await getApplicationDocumentsDirectory();
    String? path;
    String? fileName;
    String? fileExtension;
    File? newImage;
    BaseDeviceInfo? device;
    Platform.isIOS
        ? {
            await Permission.photos.request().then((value) async {
              value.isGranted
                  ? {
                      pickedFile = await ImagePicker.platform
                          .getImageFromSource(source: ImageSource.gallery)
                          .onError((error, stackTrace) {
                        AppSnackBar.showInSnackBar(
                            context: context,
                            message: 'حدث خطأ حاول لاحقا',
                            isSuccessful: false);
                      }),
                      if (pickedFile != null)
                        {
                          file = File(pickedFile!.path),
                          path = directory.path,
                          fileName = Path.basename(pickedFile!.path),
                          fileExtension = Path.extension(fileName!),
                          newImage = await file!.copy('$path/$fileName'),
                          if (fileExtension?.toLowerCase() == ".png" ||
                              fileExtension?.toLowerCase() == ".jpg")
                            {
                              imageFile =
                                  await AppPicker.editImage(image: newImage!)
                            }
                          else
                            {
                              AppSnackBar.showInSnackBar(
                                  context: context,
                                  message:
                                      ' الرجاء رفع الصورة بصيغة png او jpg',
                                  isSuccessful: false)
                            }
                        }
                    }
                  : {
                      AppDialog.showResult(
                          context: context,
                          title: 'اذونات',
                          message:
                              "الرجاء تفعيل اذن الوصول للوسائط لاكمال العملية",
                          isSuccessful: false,
                          buttonLabel: 'الإعدادات',
                          secondButtonLabel: "الغاء",
                          showSecondButton: true,
                          buttonWidth: 120.w,
                          secondButtonWidth: 80.w,
                          secondFunction: () {
                            Navigator.pop(context);
                          },
                          function: () {
                            openAppSettings();
                            Navigator.pop(context);
                          })
                    };
            })
          }
        : {
            device = await DeviceInfoPlugin().deviceInfo,
            device.data['version']['sdkInt'] > 32
                ? {
                    await Permission.photos.request().then((value) async {
                      print(value);
                      if (value.isGranted) {
                        pickedFile = await ImagePicker.platform
                            .getImageFromSource(source: ImageSource.gallery)
                            .onError((error, stackTrace) {
                          AppSnackBar.showInSnackBar(
                              context: context,
                              message: 'حدث خطأ حاول لاحقا',
                              isSuccessful: false);
                        });
                        if (pickedFile != null) {
                          file = File(pickedFile!.path);
                          path = directory.path;
                          fileName = Path.basename(pickedFile!.path);
                          fileExtension = Path.extension(fileName!);
                          newImage = await file!.copy('$path/$fileName');
                          if (fileExtension?.toLowerCase() == ".png" ||
                              fileExtension?.toLowerCase() == ".jpg") {
                            imageFile =
                                await AppPicker.editImage(image: newImage!);
                          } else {
                            AppSnackBar.showInSnackBar(
                                context: context,
                                message: ' الرجاء رفع الصورة بصيغة png او jpg',
                                isSuccessful: false);
                          }
                        }
                      } else {
                        AppDialog.showResult(
                            context: context,
                            title: 'اذونات',
                            message:
                                "الرجاء تفعيل اذن الوصول للوسائط لاكمال العملية",
                            isSuccessful: false,
                            buttonLabel: 'الإعدادات',
                            secondButtonLabel: "الغاء",
                            showSecondButton: true,
                            buttonWidth: 120.w,
                            secondButtonWidth: 80.w,
                            secondFunction: () {
                              Navigator.pop(context);
                            },
                            function: () {
                              openAppSettings();
                              Navigator.pop(context);
                            });
                      }
                    })
                  }
                : {
                    await Permission.storage.request().then((value) async {
                      print(value);
                      value.isGranted
                          ? {
                              pickedFile = await ImagePicker.platform
                                  .getImageFromSource(
                                      source: ImageSource.gallery)
                                  .onError((error, stackTrace) {
                                AppSnackBar.showInSnackBar(
                                    context: context,
                                    message: 'حدث خطأ حاول لاحقا',
                                    isSuccessful: false);
                              }),
                              if (pickedFile != null)
                                {
                                  file = File(pickedFile!.path),
                                  path = directory.path,
                                  fileName = Path.basename(pickedFile!.path),
                                  fileExtension = Path.extension(fileName!),
                                  newImage =
                                      await file!.copy('$path/$fileName'),
                                  if (fileExtension?.toLowerCase() == ".png" ||
                                      fileExtension?.toLowerCase() == ".jpg")
                                    {
                                      imageFile = await AppPicker.editImage(
                                          image: newImage!),
                                    }
                                  else
                                    {
                                      AppSnackBar.showInSnackBar(
                                          context: context,
                                          message:
                                              ' الرجاء رفع الصورة بصيغة png او jpg',
                                          isSuccessful: false)
                                    }
                                }
                            }
                          : {
                              AppDialog.showResult(
                                  context: context,
                                  title: 'اذونات',
                                  message:
                                      "الرجاء تفعيل اذن الوصول للوسائط لاكمال العملية",
                                  isSuccessful: false,
                                  buttonLabel: 'الإعدادات',
                                  secondButtonLabel: "الغاء",
                                  showSecondButton: true,
                                  buttonWidth: 120.w,
                                  secondButtonWidth: 80.w,
                                  secondFunction: () {
                                    Navigator.pop(context);
                                  },
                                  function: () {
                                    openAppSettings();
                                    Navigator.pop(context);
                                  })
                            };
                    })
                  }
          };
    return imageFile;
  }

//======================================================================================
  static Future<File?> getFile(
      {required context,
      required file,
      bool isNotPdf = false,
      List<String>? allowedExtensionsList}) async {
    File? f;
    final Directory directory = await getApplicationDocumentsDirectory();
    String? path;
    String? fileName;
    String? fileExtension;
    File? newImage;
    FilePickerResult? pickedFile;
    BaseDeviceInfo? device;
    List<String> allowedExtensions = allowedExtensionsList ??
        [
          'png',
          'jpg',
          'mp4',
          'mov',
          'jpeg',
        ];
    Platform.isIOS
        ? {
            await Permission.storage.request().then((value) async {
              value.isGranted
                  ? {
                      pickedFile = await FilePicker.platform
                          .pickFiles(
                              type: FileType.custom,
                              allowedExtensions:
                                  isNotPdf ? allowedExtensions : ['pdf'])
                          .onError((error, stackTrace) {
                        AppSnackBar.showInSnackBar(
                            context: context,
                            message: 'حدث خطأ حاول لاحقا',
                            isSuccessful: false);
                      }),
                      if (pickedFile != null)
                        {
                          f = File(pickedFile!.paths[0]!),
                          path = directory.path,
                          fileName = Path.basename(pickedFile!.paths[0]!),
                          fileExtension = Path.extension(fileName!),
                          newImage = await f!.copy('$path/$fileName'),
                          if (((fileExtension == ".pdf" ||
                                      fileExtension == ".PDF") &&
                                  !isNotPdf) ||
                              (isNotPdf &&
                                  allowedExtensions.contains(
                                      fileExtension!.replaceAll('.', ''))))
                            {
                              file = isNotPdf &&
                                      !(AppConstants.videoExtension
                                          .contains(fileExtension)) &&
                                      (fileExtension != ".pdf" &&
                                          fileExtension != ".PDF")
                                  ? await AppPicker.editImage(image: newImage!)
                                  : newImage,
                            }
                          else
                            {
                              AppSnackBar.showInSnackBar(
                                  context: context,
                                  message: 'صيغة الملف خاطئة',
                                  isSuccessful: false)
                            }
                        }
                    }
                  : {
                      AppDialog.showResult(
                          context: context,
                          title: 'اذونات',
                          message:
                              "الرجاء تفعيل اذن الوصول للملفات لاكمال العملية",
                          isSuccessful: false,
                          buttonLabel: 'الإعدادات',
                          secondButtonLabel: "الغاء",
                          showSecondButton: true,
                          buttonWidth: 120.w,
                          secondButtonWidth: 80.w,
                          secondFunction: () {
                            Navigator.pop(context);
                          },
                          function: () {
                            openAppSettings();
                            Navigator.pop(context);
                          })
                    };
            })
          }
        : {
            device = await DeviceInfoPlugin().deviceInfo,
            device.data['version']['sdkInt'] > 32
                ? {
                    pickedFile = await FilePicker.platform
                        .pickFiles(
                            type: FileType.custom,
                            allowedExtensions:
                                isNotPdf ? allowedExtensions : ['pdf'])
                        .onError((error, stackTrace) {
                      AppSnackBar.showInSnackBar(
                          context: context,
                          message: 'حدث خطأ حاول لاحقا',
                          isSuccessful: false);
                    }),
                    if (pickedFile != null)
                      {
                        f = File(pickedFile.paths[0]!),
                        path = directory.path,
                        fileName = Path.basename(pickedFile.paths[0]!),
                        fileExtension = Path.extension(fileName),
                        newImage = await f.copy('$path/$fileName'),
                        if (((fileExtension == ".pdf" ||
                                    fileExtension == ".PDF") &&
                                !isNotPdf) ||
                            (isNotPdf &&
                                allowedExtensions.contains(
                                    fileExtension!.replaceAll('.', ''))))
                          {
                            file = isNotPdf &&
                                    !(AppConstants.videoExtension
                                        .contains(fileExtension)) &&
                                    (fileExtension != ".pdf" &&
                                        fileExtension != ".PDF")
                                ? await AppPicker.editImage(image: newImage!)
                                : newImage,
                          }
                        else
                          {
                            AppSnackBar.showInSnackBar(
                                context: context,
                                message: 'صيغة الملف خاطئة',
                                isSuccessful: false)
                          }
                      }
                  }
                : {
                    await Permission.storage.request().then((value) async {
                      print(value);
                      value.isGranted
                          ? {
                              pickedFile = await FilePicker.platform
                                  .pickFiles(
                                      type: FileType.custom,
                                      allowedExtensions: isNotPdf
                                          ? allowedExtensions
                                          : ['pdf'])
                                  .onError((error, stackTrace) {
                                AppSnackBar.showInSnackBar(
                                    context: context,
                                    message: 'حدث خطأ حاول لاحقا',
                                    isSuccessful: false);
                              }),
                              if (pickedFile != null)
                                {
                                  f = File(pickedFile!.paths[0]!),
                                  path = directory.path,
                                  fileName =
                                      Path.basename(pickedFile!.paths[0]!),
                                  fileExtension = Path.extension(fileName!),
                                  newImage = await f!.copy('$path/$fileName'),
                                  if (((fileExtension == ".pdf" ||
                                              fileExtension == ".PDF") &&
                                          !isNotPdf) ||
                                      (isNotPdf &&
                                          allowedExtensions.contains(
                                              fileExtension!
                                                  .replaceAll('.', ''))))
                                    {
                                      print(
                                          '$fileExtension-------------------------------------'),
                                      file = isNotPdf &&
                                              !(AppConstants.videoExtension
                                                  .contains(fileExtension)) &&
                                              (fileExtension != ".pdf" &&
                                                  fileExtension != ".PDF")
                                          ? await AppPicker.editImage(
                                              image: newImage!)
                                          : newImage,
                                    }
                                  else
                                    {
                                      AppSnackBar.showInSnackBar(
                                          context: context,
                                          message: 'صيغة الملف خاطئة',
                                          isSuccessful: false)
                                    }
                                }
                            }
                          : {
                              AppDialog.showResult(
                                  context: context,
                                  title: 'اذونات',
                                  message:
                                      "الرجاء تفعيل اذن الوصول للملفات لاكمال العملية",
                                  isSuccessful: false,
                                  buttonLabel: 'الإعدادات',
                                  secondButtonLabel: "الغاء",
                                  showSecondButton: true,
                                  buttonWidth: 120.w,
                                  secondButtonWidth: 80.w,
                                  secondFunction: () {
                                    Navigator.pop(context);
                                  },
                                  function: () {
                                    openAppSettings();
                                    Navigator.pop(context);
                                  })
                            };
                    })
                  }
          };
    return file;
  }

  static Future<File?> editImage({required File image}) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      cropStyle: CropStyle.rectangle,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'تعديل الصورة',
            toolbarColor: AppColor.mainColor,
            toolbarWidgetColor: AppColor.white,
            activeControlsWidgetColor: AppColor.mainColor,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'تعديل الصورة',
        ),
      ],
    );
    return croppedFile == null ? null : File(croppedFile.path);
  }

  static Future<bool> downloadFile(
      {required String url, required BuildContext context}) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    File saveFile = File('/storage/emulated/0/Download');
    Dio dio = Dio();
    bool isSuccessful = false;
    BaseDeviceInfo device;
    AppDialog.showLoading(context: context);

    Platform.isIOS
        ? {
            await Permission.storage.request().then((value) async {
              value.isGranted
                  ? {
                      isSuccessful = await launchUrl(Uri.parse(
                          "https://backend.atlbha.com/storage/files/unitfile/Q4GRi1061x1699266147.pdf")),
                      Navigator.pop(context)
                    }
                  : {
                      AppDialog.showResult(
                          context: context,
                          title: 'اذونات',
                          message:
                              "الرجاء تفعيل اذن الوصول للوسائط لاكمال العملية",
                          isSuccessful: false,
                          buttonLabel: 'الإعدادات',
                          secondButtonLabel: "الغاء",
                          showSecondButton: true,
                          buttonWidth: 120.w,
                          secondButtonWidth: 80.w,
                          secondFunction: () {
                            Navigator.pop(context);
                          },
                          function: () {
                            openAppSettings();
                            Navigator.pop(context);
                          })
                    };
            })
          }
        : {
            device = await DeviceInfoPlugin().deviceInfo,
            device.data['version']['sdkInt'] > 32
                ? {
                    await dio
                        .download(
                      url,
                      '${saveFile.path}/${Path.basename(url)}',
                      onReceiveProgress: (r, totalBytes) {},
                      deleteOnError: true,
                    )
                        .then((value) {
                      Navigator.pop(context);
                      isSuccessful = true;
                    }).onError((error, stackTrace) {
                      Navigator.pop(context);
                      isSuccessful = false;
                    })
                  }
                : {
                    await Permission.storage.request().then((value) async {
                      value.isGranted
                          ? {
                              await dio
                                  .download(
                                url,
                                '${saveFile.path}/${Path.basename(url)}',
                                onReceiveProgress: (r, totalBytes) {},
                                deleteOnError: true,
                              )
                                  .then((value) {
                                Navigator.pop(context);
                                isSuccessful = true;
                              }).onError((error, stackTrace) {
                                Navigator.pop(context);
                                isSuccessful = false;
                              })
                            }
                          : {
                              AppDialog.showResult(
                                  context: context,
                                  title: 'اذونات',
                                  message:
                                      "الرجاء تفعيل اذن الوصول للوسائط لاكمال العملية",
                                  isSuccessful: false,
                                  buttonLabel: 'الإعدادات',
                                  secondButtonLabel: "الغاء",
                                  showSecondButton: true,
                                  buttonWidth: 120.w,
                                  secondButtonWidth: 80.w,
                                  secondFunction: () {
                                    Navigator.pop(context);
                                  },
                                  function: () {
                                    openAppSettings();
                                    Navigator.pop(context);
                                  })
                            };
                    })
                  }
          };

    return isSuccessful;
  }

  static Future saveFile(String fileName, bytes) async {
    final pdf = pw.Document();
    Directory? directory;
    File? file;
    try {
      if (Platform.isAndroid) {
        directory = Directory('/storage/emulated/0/Download');
      } else {
        directory = await getApplicationDocumentsDirectory();
      }

      bool hasExisted = await directory.exists();
      if (!hasExisted) {
        await directory.create();
      }

      pdf.addPage(pw.Page(
          textDirection: pw.TextDirection.rtl,
          theme: pw.ThemeData.withFont(
              base: pw.Font.ttf(
                  await rootBundle.load("assets/fonts/Tajawal-Regular.ttf"))),
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Image(pw.MemoryImage(bytes!)),
            ); // Center
          }));

      //file to saved
      file = File("${directory.path}${Platform.pathSeparator}$fileName.pdf");
      if (!file.existsSync()) {
        await file.create();
        List<int> list = [];
        await pdf.save().then((value) => list = value.toList());
        await file.writeAsBytes(list);
        print('created');
      }
      return true;
    } catch (e) {
      if (file != null && file.existsSync()) {
        file.deleteSync();
      }
      return false;
    }
  }

  static openAttachment(
      {required BuildContext context,
      required String attachment,
      VideoPlayerController? videoControllers}) async {
    bool isPlaying = false;
    Function? videoState;
    final name;
    bool exist;
    final file;
    if (attachment.toLowerCase().endsWith('.mp4') ||
        attachment.toLowerCase().endsWith('.mov')) {
      videoControllers!.value.isInitialized
          ? {
              videoState != null
                  ? {
                      videoState!(() {
                        isPlaying = true;
                        videoControllers!.play();
                        videoControllers!.setLooping(true);
                      })
                    }
                  : {
                      isPlaying = true,
                      videoControllers!.play(),
                      videoControllers!.setLooping(true)
                    }
            }
          : null;
    }
    attachment.toLowerCase().endsWith('.png') ||
            attachment.toLowerCase().endsWith('.jpg') ||
            attachment.toLowerCase().endsWith('.jpeg')
        ? {
            AppDialog.viewDialog(
              context: context,
              child: ConstrainedBox(
                  constraints:
                      BoxConstraints(maxHeight: 500.h, minHeight: 150.h),
                  child: attachment.startsWith('http')
                      ? Image.network(
                          attachment,
                          loadingBuilder: (_, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        )
                      : Image.file(File(attachment))),
              showCloseBar: true,
            )
          }
        : (attachment.toLowerCase().endsWith('.mp4') ||
                attachment.toLowerCase().endsWith('.mov'))
            ? {
                AppDialog.viewDialog(
                  context: context,
                  onClose: () {
                    Navigator.pop(context);
                    videoControllers!.pause();
                  },
                  child: StatefulBuilder(builder: (context, state) {
                    videoState = state;
                    return ConstrainedBox(
                        constraints:
                            BoxConstraints(maxHeight: 500.h, minHeight: 150.h),
                        child: videoControllers != null &&
                                videoControllers!.value.isInitialized
                            ? Stack(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        state(() {
                                          isPlaying
                                              ? videoControllers!.pause()
                                              : videoControllers!.play();
                                          isPlaying = !isPlaying;
                                        });
                                      },
                                      child: VideoPlayer(videoControllers!)),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Visibility(
                                        visible: !isPlaying,
                                        child: InkWell(
                                          onTap: () {
                                            state(() {
                                              isPlaying
                                                  ? videoControllers!.pause()
                                                  : videoControllers!.play();
                                              isPlaying = !isPlaying;
                                            });
                                          },
                                          child: Icon(
                                            AppIcons.play,
                                            size: AppSize.largeIconSize,
                                            color: AppColor.white,
                                          ),
                                        ),
                                      ))
                                ],
                              )
                            : const Center(
                                child: CircularProgressIndicator(),
                              ));
                  }),
                  showCloseBar: true,
                )
              }
            : (attachment.toLowerCase().endsWith('.pdf') ||
                    attachment.toLowerCase().endsWith('pdf'))
                ? {
                    name = attachment.split('/').last,
                    exist = File(
                            '/data/user/0/faz.it.celebrity_dashboard/app_flutter/$name')
                        .existsSync(),
                    exist
                        ? null
                        : await downloadFile(url: attachment, context: context),
                    file = File(
                        '/data/user/0/faz.it.celebrity_dashboard/app_flutter/$name'),
                    if (file == null)
                      {}
                    else
                      {
                        await OpenAppFile.open(file.path).catchError(
                            (error, stackTrace) => AppSnackBar.showInSnackBar(
                                context: context,
                                message: AppMessage.couldntOpenUrl,
                                isSuccessful: false))
                      }
                  }
                : AppSnackBar.showInSnackBar(
                    context: context,
                    message: 'حدث خطأ اثناء فتح الملف',
                    isSuccessful: false);
  }

  //save file in device======================================================================
  static Future<File> getDocumentPdf(
      {String name = 'contract.pdf', required Uint8List bytes}) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');
    await file.writeAsBytes(bytes);
    return file;
  }
}
