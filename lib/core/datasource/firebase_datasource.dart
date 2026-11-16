import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/recipe_model.dart';

class FirebaseDataSource{
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  List<RecipeModel> meals=[
    RecipeModel(
      dishName:"Butter Chicken",
        dishDescription:"Creamy and easy to make right at home in one pan with simple ingredients! Full of incredible flavours, it rivals any Indian restaurant! Aromatic golden chicken pieces in an incredible creamy curry sauce, this Butter Chicken recipe is one of the best you will try!",
        time:"45 mins",
        price:56,
        imagePath:"assets/images/butter_chicken.png",
        rating:4.5
    ),
    RecipeModel(
      dishName:"Paneer Tikka",
      dishDescription: "Popular Indian appetizer made with cubes of paneer & veggies marinated with yogurt and spices. Traditionally it's grilled in a tandoor but you can make the same version in the oven with this easy recipe!",
      time: "35 mins",
      price: 41,
      imagePath: "assets/images/paneer_tikka.png",
      rating: 4.2,
    ),
    RecipeModel(
      dishName:"Khichdi",
      dishDescription: "This Khichdi recipe is a light and easy to digest Indian dish made with rice and moong dal. Nutritious and light on the tummy, serve this healthy, comforting and nourishing porridge-like Dal Khichdi with curd, raita or papad.",
      time: "30 mins",
      price: 20,
      imagePath: "assets/images/khichdi.png",
      rating: 5.0,
    ),
    RecipeModel(
      dishName:"Gobi Manchurian",
      dishDescription: "This popular Indian-Chinese recipe is filled with so much flavor and deliciousness. Make this popular dish in two ways by tossing fried cauliflower florets in a spicy, sweet-sour, umami sauce.",
      time: "35 mins",
      price: 30,
      imagePath: "assets/images/gobi_manchurian.png",
      rating: 4.9,
    ),
    RecipeModel(
      dishName:"Chicken Biryani",
      dishDescription: "Chicken Biryani is a delicious savory rice dish that is loaded with spicy marinated chicken, caramelized onions, and flavorful saffron rice.",
      time: "1 hr 25 mins",
      price: 70,
      imagePath: "assets/images/chicken_biryani.png",
      rating: 4.8,
    ),
    RecipeModel(
      dishName:"Goan Fish Curry",
      dishDescription: "Goan fish curry is a perfect combination of spicy and coconut flavors. It is sweet, tangy, and spicy curry packed with coastal flavors.",
      time: "40 mins",
      price: 50,
      imagePath: "assets/images/goan_fish_curry.png",
      rating: 4.6,
    ),
    RecipeModel(
      dishName:"Palak Paneer",
      dishDescription: "This deliciously creamy and vibrantly green dish is made with paneer in a mildly spiced fresh spinach sauce. This is a delightful and easy to make vegetarian main you just have to try!",
      time: "45 mins",
      price: 45,
      imagePath: "assets/images/palak_paneer.png",
      rating: 4.8,
    ),
    RecipeModel(
      dishName:"Kadhi Pakora",
      dishDescription: "A Punjabi comfort food made with the crispy onion fritters dunked in a spiced, savory, tangy yogurt sauce.",
      time: "1 hr 10 mins",
      price: 30,
      imagePath: "assets/images/kadhi_pakora.png",
      rating: 4.8,
    ),
    RecipeModel(
      dishName:"Tandoori Chicken",
      dishDescription: "Spicy chicken marinated in yogurt, Kashmiri red chili powder, fresh ginger-garlic, garam masala, and then grilled to perfection! Tandoori Chicken is a classic Indian dish that is healthy,easy to cook, and a definite crowd-pleaser",
      time: "1 hr 5 mins",
      price: 55,
      imagePath: "assets/images/tandoori_chicken.png",
      rating: 5.0,
    ),
    RecipeModel(
      dishName:"Rogan Josh",
      dishDescription: "An Indian lamb curry slow-cooked in lots of spice until it is tender and delicious. An Indian favorite sure to please and impress.",
      time: "1 hr 35 mins",
      price: 80,
      imagePath: "assets/images/rogan_josh.png",
      rating: 4.4,
    ),
    RecipeModel(
      dishName:"Butter Chicken",
      dishDescription: "Creamy and easy to make right at home in one pan with simple ingredients! Full of incredible flavours, it rivals any Indian restaurant! Aromatic golden chicken pieces in an incredible creamy curry sauce, this Butter Chicken recipe is one of the best you will try!",
      time: "45 mins",
      price: 56,
      imagePath: "assets/images/butter_chicken.png",
      rating: 4.5,
    ),
    RecipeModel(
      dishName:"Pav Bhaji",
      dishDescription: "Pav Bhaji is popular Indian street food where dinner rolls/buns are served with spicy mashed veggies topped with dollop of butter. Street food doesn’t get better than this!",
      time: "45 mins",
      price: 50,
      imagePath: "assets/images/pav_bhaji.png",
      rating: 4.9,
    ),
    RecipeModel(
      dishName:"Chicken Shawarma",
      dishDescription: "Shawarma, a popular Middle Eastern dish that is loved all over the world. Traditionally marinated chicken is cooked in a spit shredded and tossed with fresh veggies, toum sauce and wrapped in a kuboos. This delicious yet healthy chicken shawarma made using pita bread, chicken filling, garlic sauce",
      time: "1 hr 30 mins",
      price: 60,
      imagePath: "assets/images/chicken_shawarma.png",
      rating: 5.0,
    ),
  ];
  List<RecipeModel> mainCourses = [
    RecipeModel(
      dishName: "Grilled Ribeye Steak",
      dishDescription:
      "Juicy, tender ribeye steak seasoned with coarse sea salt, cracked black pepper, and fresh rosemary, seared to perfection and basted with garlic herb butter.",
      time: "30 mins",
      price: 95,
      imagePath: "assets/images/ribeye_steak.jpg",
      rating: 4.9,
    ),
    RecipeModel(
      dishName: "Chicken Alfredo Pasta",
      dishDescription:
      "Fettuccine pasta tossed in a rich, velvety parmesan cream sauce topped with golden pan-seared chicken breast slices and freshly chopped parsley.",
      time: "35 mins",
      price: 62,
      imagePath: "assets/images/chicken_alfredo.jpg",
      rating: 4.7,
    ),
    RecipeModel(
      dishName: "Baked Honey Garlic Salmon",
      dishDescription:
      "Flaky Atlantic salmon fillets glazed with a sweet and savory honey garlic soy sauce, oven-baked until caramelized and served with steamed asparagus.",
      time: "25 mins",
      price: 85,
      imagePath: "assets/images/honey_garlic_salmon.jpg",
      rating: 4.8,
    ),
    RecipeModel(
      dishName: "Classic Beef Lasagna",
      dishDescription:
      "Layers of tender pasta sheets, slow-simmered rich beef bolognese sauce, creamy béchamel, and melted mozzarella and parmesan cheeses baked until golden.",
      time: "1 hr 15 mins",
      price: 68,
      imagePath: "assets/images/beef_lasagna.jpg",
      rating: 4.9,
    ),
    RecipeModel(
      dishName: "Mushroom Risotto",
      dishDescription: "Creamy Italian Arborio rice slowly cooked with vegetable broth, sautéed wild mushrooms, white wine, shallots, and aged Parmigiano-Reggiano.",
      time: "40 mins",
      price: 58,
      imagePath: "assets/images/mushroom_risotto.jpg",
      rating: 4.6,
    ),
  ];
  List<RecipeModel> appetizers = [
    RecipeModel(
      dishName: "Crispy Mozzarella Sticks",
      dishDescription:
      "Golden-fried breaded mozzarella cheese sticks with a crunchy exterior and gooey melted center, served warm alongside zesty marinara dipping sauce.",
      time: "20 mins",
      price: 28,
      imagePath: "assets/images/mozzarella_sticks.jpg",
      rating: 4.7,
    ),
    RecipeModel(
      dishName: "Tomato Basil Bruschetta",
      dishDescription:
      "Toasted crusty baguette slices rubbed with fresh garlic and topped with diced ripe tomatoes, sweet basil leaves, extra virgin olive oil, and balsamic glaze.",
      time: "15 mins",
      price: 24,
      imagePath: "assets/images/bruschetta.jpg",
      rating: 4.5,
    ),
    RecipeModel(
      dishName: "Crispy Vegetable Spring Rolls",
      dishDescription:
      "Delicate, crunchy pastry rolls stuffed with seasoned shredded cabbage, carrots, glass noodles, and shiitake mushrooms, served with sweet chili sauce.",
      time: "30 mins",
      price: 26,
      imagePath: "assets/images/spring_rolls.jpg",
      rating: 4.6,
    ),
    RecipeModel(
      dishName: "Stuffed Mushrooms",
      dishDescription:
      "Tender button mushroom caps baked with a savory filling of cream cheese, roasted garlic, crispy breadcrumbs, fresh herbs, and grated parmesan.",
      time: "25 mins",
      price: 32,
      imagePath: "assets/images/stuffed_mushrooms.jpg",
      rating: 4.8,
    ),
    RecipeModel(
      dishName: "Buffalo Chicken Wings",
      dishDescription:
      "Crispy baked chicken wings coated in a tangy, spicy buffalo butter sauce, served with cool creamy ranch dressing and crisp celery sticks.",
      time: "40 mins",
      price: 38,
      imagePath: "assets/images/buffalo_wings.jpg",
      rating: 4.9,
    ),
  ];
  List<RecipeModel> sideDishes = [
    RecipeModel(
      dishName: "Crispy Parmesan Truffle Fries",
      dishDescription:
      "Hand-cut golden french fries tossed in aromatic white truffle oil, freshly grated parmesan cheese, sea salt, and chopped parsley.",
      time: "30 mins",
      price: 27,
      imagePath: "assets/images/truffle_fries.jpg",
      rating: 4.9,
    ),
    RecipeModel(
      dishName: "Roasted Garlic Broccoli",
      dishDescription:
      "Fresh broccoli florets oven-roasted at high heat with olive oil, minced garlic, and a squeeze of fresh lemon juice for a crisp-tender finish.",
      time: "20 mins",
      price: 19,
      imagePath: "assets/images/roasted_broccoli.jpg",
      rating: 4.5,
    ),
    RecipeModel(
      dishName: "Classic Caesar Salad",
      dishDescription:
      "Crisp romaine lettuce leaves tossed in a creamy homemade Caesar dressing with crunchy garlic croutons and shaved parmesan cheese.",
      time: "15 mins",
      price: 25,
      imagePath: "assets/images/caesar_salad.jpg",
      rating: 4.6,
    ),
    RecipeModel(
      dishName: "Cheesy Garlic Bread",
      dishDescription:
      "Warm, crusty French bread slathered with roasted garlic herb butter and topped with a bubbly layer of melted mozzarella and cheddar cheese.",
      time: "15 mins",
      price: 20,
      imagePath: "assets/images/garlic_bread.jpg",
      rating: 4.8,
    ),
  ];
  // Future<void> addRecipes() async {
  //   try {
  //     for (var recipe in mainCourses) {
  //       await _firestore
  //           .collection("mainCourses")
  //           .add(recipe.toJson());
  //     }
  //     for (var recipe in appetizers) {
  //       await _firestore
  //           .collection("appetizers")
  //           .add(recipe.toJson());
  //     }
  //     for (var recipe in sideDishes) {
  //       await _firestore
  //           .collection("sideDishes")
  //           .add(recipe.toJson());
  //     }
  //   } catch (e) {
  //   print(e.toString());
  //   }
  // }
  Future<List<RecipeModel>> getMainCourses() async{
    List<RecipeModel> mainCourses = [];
    try {
      QuerySnapshot<Map<String, dynamic>> snapshotMC = await _firestore.collection("mainCourses").get();
      for (var element in snapshotMC.docs) {
        mainCourses.add(
          RecipeModel.fromJson(element.data()),
        );
      }
      return mainCourses;
    } catch (e) {
      print("Error fetching recipes: $e");
      rethrow;
    }
  }
  Future<List<RecipeModel>> getAppetizers() async{
    List<RecipeModel> appetizers = [];
    try {
      QuerySnapshot<Map<String, dynamic>> snapshotA = await _firestore.collection("appetizers").get();
      for (var element in snapshotA.docs) {
        appetizers.add(
          RecipeModel.fromJson(element.data()),
        );
      }
      return appetizers;
    } catch (e) {
      print("Error fetching recipes: $e");
      rethrow;
    }
  }
  Future<List<RecipeModel>> getSideDishes() async{
    List<RecipeModel> sideDishes = [];
    try {
      QuerySnapshot<Map<String, dynamic>> snapshotSD = await _firestore.collection("sideDishes").get();
      for (var element in snapshotSD.docs) {
        sideDishes.add(
          RecipeModel.fromJson(element.data()),
        );
      }
      return sideDishes;
    } catch (e) {
      print("Error fetching recipes: $e");
      rethrow;
    }
  }
  Future<List<RecipeModel>> getRecipes() async {
    List<RecipeModel> recipes = [];
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore.collection("recipes").get();
      for (var element in snapshot.docs) {
        recipes.add(
          RecipeModel.fromJson(element.data()),
        );
      }
      return recipes;
    } catch (e) {
      print("Error fetching recipes: $e");
      rethrow;
    }
  }
}