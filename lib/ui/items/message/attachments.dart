import 'package:flutter/material.dart';
import 'package:vk_chat/models/attachment/attachment.dart';
import 'package:vk_chat/models/message.dart';

class Attachments {

  Message message;

  Attachments(this.message);

  Widget build() {
    if(message.attachments != null && message.attachments.length != 0) {
      List<Widget> widgets = new List();
      message.attachments.forEach((attachment) {
        widgets.add(_buildDivider());
        widgets.add(_buildAttachment(attachment));
      });
      widgets.add(_buildDivider());
      return Column(children: widgets);
    }
    return null;
  }

  Widget _buildAttachment(Attachment attachment) {
    if(attachment.type == "photo")
      return _buildPhoto(attachment);
    if(attachment.type == "video")
      return _buildVideo(attachment);
    if(attachment.type == "audio")
      return _buildAudio(attachment);
    if(attachment.type == "doc")
      return _buildDoc(attachment);
    if(attachment.type == "wall")
      return _buildWall(attachment);
    if(attachment.type == "market")
      return _buildMarket(attachment);
    return null;
  }

  Widget _buildPhoto(Attachment attachment) {
    return null;
  }

  Widget _buildVideo(Attachment attachment) {
    return null;
  }

  Widget _buildAudio(Attachment attachment) {
    return null;
  }

  Widget _buildDoc(Attachment attachment) {
    return null;
  }

  Widget _buildWall(Attachment attachment) {
    return null;
  }

  Widget _buildMarket(Attachment attachment) {
    return null;
  }

  Widget _buildDivider() {
    return Container(height: 1.0, color: Color.fromARGB(255, 0, 0, 0));
  }
}