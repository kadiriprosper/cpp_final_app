class MessageModel {
  MessageModel(
      {required this.sender, required this.message, required this.timeSent});
  int sender;
  String message;
  String timeSent;

  factory MessageModel.fromMap(Map<String, dynamic> data) {
    return MessageModel(
      sender: int.parse(data['sender']),
      message: data['message'] as String,
      timeSent: data['time sent'] as String,
    );
  }
}
