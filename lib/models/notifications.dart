class Notification {
  int? ID;
  String? title;
  String? message;
  String? type;
  bool? read;
  int? userID;

  Notification({
    this.ID,
    this.title,
    this.message,
    this.type,
    this.read,
    this.userID,
  });
}