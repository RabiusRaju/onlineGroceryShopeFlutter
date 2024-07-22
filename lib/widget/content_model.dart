class OnboardingContent {
  String image;
  String title;
  String description;

  OnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      image: 'images/screen1.png',
      title: 'Select from Our\n    Best Menu',
      description: "Pick your food from our menu\n     More than 35 times"),

  OnboardingContent(
      image: 'images/screen2.png',
      title: 'Easy and Online Payment',
      description: "You can pay cash on delivery and\n     Card payment is available"),

  OnboardingContent(
      image: 'images/screen3.png',
      title: 'Quick Delivery at your Doorstep',
      description: "Delivery you food at your\n      Doorstep"),

];
