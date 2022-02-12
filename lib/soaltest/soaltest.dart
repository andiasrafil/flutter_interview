import 'dart:ffi';

main() {
  List<String> data = ["A", "B", "C", "A", "D", "A"];
  List<Counter> datas = [];
  for (int i = 0; i < data.length; i++) {
    if (datas.isNotEmpty) {
      final apaini = datas.map((e) => e.object == data[i]).toList();
      if (apaini.first) {
        final getIndex =
            datas.indexWhere((element) => element.object == data[i]);
        final dataa = datas[getIndex];
        final updatedData =
            Counter(count: dataa.count + 1, object: dataa.object);
      } else {
        datas.add(Counter(count: 1, object: data[i]));
      }
    } else {
      datas.add(Counter(count: 1, object: data[i]));
    }
  }
}

class Counter {
  Counter({required this.count, required this.object});
  var object;
  var count;
}
