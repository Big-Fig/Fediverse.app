import 'package:auto_size_text/auto_size_text.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_model.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachments_collection_bloc.dart';
import 'package:fedi/app/ui/fedi_colors.dart';
import 'package:fedi/app/ui/fedi_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class UploadMediaAttachmentsNonMediaListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaAttachmentsCollectionBloc =
        IUploadMediaAttachmentsCollectionBloc.of(context, listen: false);
    return StreamBuilder<List<IUploadMediaAttachmentBloc>>(
        stream:
            mediaAttachmentsCollectionBloc.onlyNonMediaAttachmentBlocsStream,
        initialData: mediaAttachmentsCollectionBloc.onlyNonMediaAttachmentBlocs,
        builder: (context, snapshot) {
          var mediaItemBlocs = snapshot.data;

          if (mediaItemBlocs.isEmpty) {
            return SizedBox.shrink();
          }

          return Container(
            width: double.infinity,
            child: ListView(
              shrinkWrap: true,
              children: [
                ...mediaItemBlocs.map((mediaItemBloc) {
                  var filePath = mediaItemBloc.filePickerFile.file.path;
                  var fileName = basename(filePath);
                  var fileExtension = extension(filePath);
                  fileExtension = fileExtension?.replaceAll(".", "");

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        border: Border.all(color: FediColors.ultraLightGrey),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 70.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  width: 1,
                                  color: FediColors.ultraLightGrey,
                                ),
                              ),
                            ),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                  width: 1,
                                  color: FediColors.darkGrey,
                                )),
                                child: Center(
                                    child: AutoSizeText(
                                  fileExtension?.toUpperCase(),
                                  style: TextStyle(color: FediColors.darkGrey),
                                )),
                              ),
                            )),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        fileExtension?.toUpperCase(),
                                        style: TextStyle(
                                            color: FediColors.grey,
                                            height: 1.5,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        fileName,
                                        style: TextStyle(
                                            color: FediColors.darkGrey,
                                            height: 1.5,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  StreamBuilder<UploadMediaAttachmentState>(
                                      stream: mediaItemBloc.uploadStateStream,
                                      initialData: mediaItemBloc.uploadState,
                                      builder: (context, snapshot) {
                                        var uploadState = snapshot.data;

                                        switch (uploadState) {
                                          case UploadMediaAttachmentState
                                              .uploading:
                                            return CircularProgressIndicator();
                                            break;
                                          case UploadMediaAttachmentState
                                              .notUploaded:
                                          case UploadMediaAttachmentState
                                              .uploaded:
                                          case UploadMediaAttachmentState
                                              .failed:
                                          default:
                                            return IconButton(
                                              onPressed: () {
                                                mediaAttachmentsCollectionBloc
                                                    .detachMedia(mediaItemBloc
                                                        .filePickerFile);
                                              },
                                              icon: Icon(FediIcons.close),
                                            );
                                            break;
                                        }
                                      }),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          );
        });
  }
}
