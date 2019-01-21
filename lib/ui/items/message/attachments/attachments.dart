import 'package:flutter/material.dart';
import 'package:vk_chat/models/attachment/attachment.dart';
import 'package:vk_chat/ui/items/message/attachments/audio.dart';
import 'package:vk_chat/ui/items/message/attachments/doc.dart';
import 'package:vk_chat/ui/items/message/attachments/link.dart';
import 'package:vk_chat/ui/items/message/attachments/market.dart';
import 'package:vk_chat/ui/items/message/attachments/photo.dart';
import 'package:vk_chat/ui/items/message/attachments/sticker.dart';
import 'package:vk_chat/ui/items/message/attachments/video.dart';
import 'package:vk_chat/ui/items/message/attachments/wall.dart';

class Attachments extends StatelessWidget {

  final List<Attachment> attachments;

  Attachments(this.attachments);

  @override
  Widget build(BuildContext context) {
    if (attachments != null && attachments.length != 0) {
      List<Widget> widgets = new List();
      widgets.add(_buildAttachment(attachments[0]));
      if(attachments.length > 1) {
        widgets.add(Padding(
          child: Text("+ " + (attachments.length - 1).toString(),
            style: TextStyle(
                color: Colors.blueAccent, fontWeight: FontWeight.bold),
          ),
          padding: EdgeInsets.only(top: 3.0),
        ));
      }
      return Column(children: widgets);
    }
    return emptyView();
  }

  Widget _buildAttachment(Attachment attachment) {
    if (attachment.type == "photo") return _buildPhoto(attachment);
    if (attachment.type == "video") return _buildVideo(attachment);
    if (attachment.type == "audio") return _buildAudio(attachment);
    if (attachment.type == "doc") return _buildDoc(attachment);
    if (attachment.type == "wall") return _buildWall(attachment);
    if (attachment.type == "market") return _buildMarket(attachment);
    if (attachment.type == "link") return _buildLink(attachment);
    if (attachment.type == "sticker") return _buildSticker(attachment);
    return Text(attachment.type);
  }

  Widget _buildPhoto(Attachment attachment) {
    return PhotoWidget(attachment.photo);
  }

  Widget _buildVideo(Attachment attachment) {
    return VideoWidget(attachment.video);
  }

  Widget _buildAudio(Attachment attachment) {
    return AudioWidget(attachment.audio);
  }

  Widget _buildDoc(Attachment attachment) {
    return DocWidget(attachment.doc);
  }

  Widget _buildWall(Attachment attachment) {
    return WallWidget(attachment.wall);
  }

  Widget _buildMarket(Attachment attachment) {
    return MarketWidget(attachment.market);
  }

  Widget _buildLink(Attachment attachment) {
    return LinkWidget(attachment.link);
  }

  Widget _buildSticker(Attachment attachment) {
    return StickerWidget(attachment.sticker);
  }

  Widget emptyView() {
    return Container(width: 0.0, height: 0.0);
  }
}
