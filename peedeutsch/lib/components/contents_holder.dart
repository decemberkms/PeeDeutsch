class ContentHolder {
  final String itsName;
  final String imagePath;

  final String type; // "image" or "text"
  final String thaiMeaning;
  final String answer; // example

  ContentHolder({
    this.itsName = "no question",
    this.answer = "No answer",
    this.type = "text",
    this.imagePath = "None",
    this.thaiMeaning = "None",
  });
}
