import "dart:io";

class Item {
  int? id;
  String? description;
  int? quantity;
  String? unitMeasurement;
  String? unitPrice;

  Item(
      {this.id,
      this.description,
      this.quantity,
      this.unitMeasurement,
      this.unitPrice});

  printItem() {
    print(
        """ID: ${this.id}  |  Description: ${this.description}  |  Quantity: ${this.quantity}  |  Unit of Measurement: ${this.unitMeasurement}  |  Unit Price: ${this.unitPrice}""");
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

List<Map<String, int>> countItem(List<Item> items) {
  List<Map<String, int>> itemsCount = [];

  for (int id in groupById(items)) {
    int count = 0;
    for (Item item in items) {
      if (id == item.id) {
        count++;
      }
    }
    itemsCount.add({"id": id, "count": count});
  }

  return itemsCount;
}

void main() {
  stdout.write("Total Items: ");

  final itemsCount = int.parse(stdin.readLineSync()!);

  int i = 0;

  do {
    print("############# Item #${i + 1} #############");

    stdout.write("ID: ");
    final id = int.parse(stdin.readLineSync()!);
    // stdout.write("Description: ");
    // final description = stdin.readLineSync();
    // stdout.write("Quantity: ");
    // final quantity = int.parse(stdin.readLineSync()!);
    // stdout.write("Unit of Measurement: ");
    // final unitMeasurement = stdin.readLineSync();
    // stdout.write("Unit of Price: ");
    // final unitPrice = stdin.readLineSync();

    Item item = Item(
        id: id,
        description: null,
        quantity: null,
        unitMeasurement: null,
        unitPrice: null);

    items.add(item);
    i++;
  } while (i < itemsCount);

  countItem(items).forEach((element) {
    print(element);
  });
}
