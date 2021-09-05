class MessageModel {
  String? senderUId;
  String? receiverUId;
  String? text;
  String? time;

  MessageModel({
    this.senderUId,
    this.receiverUId,
    this.text,
    this.time,
  });

  MessageModel.fromMap(Map<String, dynamic> json) {
    senderUId = json['senderUId'];
    receiverUId = json['receiverUId'];
    text = json['text'];
    time = json['time'];
  }

  Map<String, dynamic> toMap() => {
    'senderUId': senderUId,
    'receiverUId': receiverUId,
    'text': text,
    'time': time,
  };
}