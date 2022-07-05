class NIKParser {
  static List mapResult(data) {
    return [
      data.getData("kelamin"),
      data.getData("lahir")["string"],
      data.capitalize(data.getData("provinsi")),
      data.capitalize(data.getData("kotakab")),
      data.capitalize(data.getData("kecamatan")),
      data.getData("tambahan")["kodepos"],
      data.getData("uniqcode"),
    ];
  }
}
