class Covid {
  int statusCode;
  Data data;
  String error;

  Covid({this.statusCode, this.data});

  Covid.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Covid.withError(String errorMessage) {
    error = errorMessage;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  Metadata metadata;
  List<Content> content;

  Data({this.metadata, this.content});

  Data.fromJson(Map<String, dynamic> json) {
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    if (json['content'] != null) {
      content = new List<Content>();
      json['content'].forEach((v) {
        content.add(new Content.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.metadata != null) {
      data['metadata'] = this.metadata.toJson();
    }
    if (this.content != null) {
      data['content'] = this.content.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Metadata {
  Null lastUpdate;

  Metadata({this.lastUpdate});

  Metadata.fromJson(Map<String, dynamic> json) {
    lastUpdate = json['last_update'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['last_update'] = this.lastUpdate;
    return data;
  }
}

class Content {
  String kodeProv;
  String namaProv;
  String kodeKab;
  String namaKab;
  int odpProses;
  int odpSelesai;
  int odpTotal;
  int pdpProses;
  int pdpSelesai;
  int pdpTotal;
  int positif;
  int sembuh;
  int meninggal;

  Content(
      {this.kodeProv,
      this.namaProv,
      this.kodeKab,
      this.namaKab,
      this.odpProses,
      this.odpSelesai,
      this.odpTotal,
      this.pdpProses,
      this.pdpSelesai,
      this.pdpTotal,
      this.positif,
      this.sembuh,
      this.meninggal});

  Content.fromJson(Map<String, dynamic> json) {
    kodeProv = json['kode_prov'];
    namaProv = json['nama_prov'];
    kodeKab = json['kode_kab'];
    namaKab = json['nama_kab'];
    odpProses = json['odp_proses'];
    odpSelesai = json['odp_selesai'];
    odpTotal = json['odp_total'];
    pdpProses = json['pdp_proses'];
    pdpSelesai = json['pdp_selesai'];
    pdpTotal = json['pdp_total'];
    positif = json['positif'];
    sembuh = json['sembuh'];
    meninggal = json['meninggal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kode_prov'] = this.kodeProv;
    data['nama_prov'] = this.namaProv;
    data['kode_kab'] = this.kodeKab;
    data['nama_kab'] = this.namaKab;
    data['odp_proses'] = this.odpProses;
    data['odp_selesai'] = this.odpSelesai;
    data['odp_total'] = this.odpTotal;
    data['pdp_proses'] = this.pdpProses;
    data['pdp_selesai'] = this.pdpSelesai;
    data['pdp_total'] = this.pdpTotal;
    data['positif'] = this.positif;
    data['sembuh'] = this.sembuh;
    data['meninggal'] = this.meninggal;
    return data;
  }
}
