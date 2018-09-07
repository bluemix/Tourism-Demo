class Destination {
  String title;
  String titleAr;
  String emoji;
  String photo;
  int price;
  int numDays;
  String airlines;
  String airlinesAr;
  String food;
  String foodAr;
  int hotelStars;
  String shortDescription;
  String shortDescriptionAr;
  String dateFrom;
  String dateTo;
  List<Activities> activities;

  Destination(
      {this.title,
        this.titleAr,
        this.emoji,
        this.photo,
        this.price,
        this.numDays,
        this.airlines,
        this.airlinesAr,
        this.food,
        this.foodAr,
        this.hotelStars,
        this.shortDescription,
        this.shortDescriptionAr,
        this.dateFrom,
        this.dateTo,
        this.activities});

  Destination.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    titleAr = json['title_ar'];
    emoji = json['emoji'];
    photo = json['photo'];
    price = json['price'];
    numDays = json['num_days'];
    airlines = json['airlines'];
    airlinesAr = json['airlines_ar'];
    food = json['food'];
    foodAr = json['food_ar'];
    hotelStars = json['hotel_stars'];
    shortDescription = json['short_description'];
    shortDescriptionAr = json['short_description_ar'];
    dateFrom = json['date_from'];
    dateTo = json['date_to'];
    if (json['activities'] != null) {
      activities = new List<Activities>();
      json['activities'].forEach((v) {
        activities.add(new Activities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['title_ar'] = this.titleAr;
    data['emoji'] = this.emoji;
    data['photo'] = this.photo;
    data['price'] = this.price;
    data['num_days'] = this.numDays;
    data['airlines'] = this.airlines;
    data['airlines_ar'] = this.airlinesAr;
    data['food'] = this.food;
    data['food_ar'] = this.foodAr;
    data['hotel_stars'] = this.hotelStars;
    data['short_description'] = this.shortDescription;
    data['short_description_ar'] = this.shortDescriptionAr;
    data['date_from'] = this.dateFrom;
    data['date_to'] = this.dateTo;
    if (this.activities != null) {
      data['activities'] = this.activities.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Activities {
  String city;
  String cityAr;
  String dateFrom;
  String dateTo;
  String activity;
  String activityAr;
  String photo;

  Activities(
      {this.city,
        this.cityAr,
        this.dateFrom,
        this.dateTo,
        this.activity,
        this.activityAr,
        this.photo});

  Activities.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    cityAr = json['city_ar'];
    dateFrom = json['date_from'];
    dateTo = json['date_to'];
    activity = json['activity'];
    activityAr = json['activity_ar'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['city_ar'] = this.cityAr;
    data['date_from'] = this.dateFrom;
    data['date_to'] = this.dateTo;
    data['activity'] = this.activity;
    data['activity_ar'] = this.activityAr;
    data['photo'] = this.photo;
    return data;
  }
}