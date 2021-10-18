class Global {
  int NewConfirmed ;
  int TotalConfirmed ;
  int NewDeaths ;
  int TotalDeaths ;
  int NewRecovered ;
  int TotalRecovered ;
  Global.fromJson (Map<String , dynamic > json){
    this.NewConfirmed = json["NewConfirmed"];
    this.TotalConfirmed = json["TotalConfirmed"];
    this.NewDeaths = json["NewDeaths"];
    this.TotalDeaths = json["TotalDeaths"];
    this.NewRecovered = json["NewRecovered"];
    this.TotalRecovered = json["TotalRecovered"];
  }
}