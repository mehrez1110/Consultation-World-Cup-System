// class Stadium {
//   final id;
//   final name;
//   final shape;
//   final seatsCount;
//   final vipLounge;
//   final stadiumslist;

//   Stadium({
//     this.id,
//     this.name,
//     this.shape,
//     this.seatsCount,
//     this.vipLounge,
//     this.stadiumslist,
//   });

//   static fromJson(responseItem) {
//     return Stadium(
//       id: responseItem['id'],
//       name: responseItem['name'],
//       shape: responseItem['shape'],
//       seatsCount: responseItem['seatsCount'],
//       vipLounge: responseItem['vipLounge'],
//     );
//   }

//   // convert to json
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'shape': shape,
//       'seatsCount': seatsCount,
//       'vipLounge': vipLounge,
//     };
//   }
// }
