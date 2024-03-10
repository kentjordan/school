import "dart:io";

class Item {
  int? id;
  String? description;
  int? quantity;
  String? unitMeasurement;
  double? unitPrice;

  Item(
      {this.id,
      this.description,
      this.quantity,
      this.unitMeasurement,
      this.unitPrice});

  printItem() {
    return """ID: ${this.id}
    Description: ${this.description}
    Quantity: ${this.quantity}
    Unit of Measurement: ${this.unitMeasurement}
    Unit Price: ${this.unitPrice}""";
  }
}

List<Item> items = [];

List<int> groupById(List<Item> items) {
  List<int> groups = [];

  for (Item item in items) {
    bool isGroupExisted = groups.contains(item.id);
    if (!isGroupExisted) {
      groups.add(item.id!);
    }
  }

  return groups;
}

List<Map<String, dynamic>> countItem(List<Item> items) {
  List<Map<String, dynamic>> itemsCount = [];

  for (int id in groupById(items)) {
    int count = 0;

    for (Item item in items) {
      if (id == item.id) {
        count++;
      }
    }

    for (Item item in items) {
      if (id == item.id) {
        itemsCount.add({"item": item, "count": count});
        break;
      }
    }
  }

  return itemsCount;
}

void main() {
  print("========== INPUT ==========");
  stdout.write("Total Items: ");

  final itemsCount = int.parse(stdin.readLineSync()!);

  int i = 0;

  do {
    print("############# Item #${i + 1} #############");

    stdout.write("ID: ");
    final id = int.parse(stdin.readLineSync()!);
    stdout.write("Description: ");
    final description = stdin.readLineSync();
    stdout.write("Quantity: ");
    final quantity = int.parse(stdin.readLineSync()!);
    stdout.write("Unit of Measurement: ");
    final unitMeasurement = stdin.readLineSync();
    stdout.write("Unit Price: ");
    final unitPrice = double.parse(stdin.readLineSync()!);

    Item item = Item(
        id: id,
        description: description,
        quantity: quantity,
        unitMeasurement: unitMeasurement,
        unitPrice: unitPrice);

    items.add(item);
    i++;
  } while (i < itemsCount);
  print("========== OUTPUT ==========");
  countItem(items).forEach((element) {
    print('''
    ${element["item"].printItem()}
    Quantity: ${element["count"]}
    Total Price per item: ${element["item"].unitPrice}
    Grand Total: ${element["count"] * element["item"].unitPrice}
    ''');
  });
}
