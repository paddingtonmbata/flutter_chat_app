import "package:equatable/equatable.dart";
import "package:uuid/uuid.dart";

import '../models.dart';

class Message extends Equatable {
  final String? id;
  final String? chatRoomId;
  final String? sendUserId;
  final String? receiveUserId;
  final String? content;
  final Attachment? attachment;
  final DateTime createdAt;

  const Message({
    this.id,
    required this.chatRoomId,
    required this.sendUserId,
    required this.receiveUserId,
    this.content,
    this.attachment,
    required this.createdAt,
  });

  Message copyWidth({
    String? id,
    String? chatRoomId,
    String? sendUserId,
    String? receiveUserId,
    String? content,
    Attachment? attachment,
    DateTime? createdAt,
  }) {
    return Message(
      id: id ?? this.id,
      chatRoomId: chatRoomId ?? this.chatRoomId,
      sendUserId: sendUserId ?? this.sendUserId,
      receiveUserId: receiveUserId ?? this.receiveUserId,
      content: content ?? this.content,
      attachment: attachment ?? this.attachment,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory Message.fromJson(Map<Strin, dynamic> json) {
    return Message(
      id: json['id'] ?? const Uuid().v4(),
      chatRoomId: json['chat_room_id'] ?? '',
      sendUserId: json['send_user_id'] ?? '',
      receiveUserId: json['receive_user_id'] ?? '',
      content: json['content'],
      attachment: json['attachment'] != null ? Attachment.fromJson(json['attachment']) : null,
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chat_room_id': chatRoomId,
      'send_user_id': sendUserId,
      'content': content,
      'created_at': createdAt,
    };
  }

  @override
  List<Object?> get props => [id, chatRoomId, sendUserId, receiveUserId, content, attachment, createdAt];
}