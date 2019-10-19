import { HttpClient } from "@angular/common/http";
import { Component, OnInit } from "@angular/core";
import { Matricula } from "src/app/Interfaces/interfaces";

@Component({
  selector: "app-matricula",
  templateUrl: "./matricula.page.html",
  styleUrls: ["./matricula.page.scss"]
})
export class MatriculaPage implements OnInit {
  urlApi: string = "http://localhost:3000/predios";
  getWebServiceId: Matricula;
  getWebService: any;

  constructor(private httpClient: HttpClient) {}

  ngOnInit() {
    this.getDataFromNodeJs().subscribe(
      data => {
        this.getWebService = data;
        console.log(this.getWebService);
        console.log(data);
      },
      error => console.log(error)
    );

    this.getDataFromNodeJsId().subscribe(
      data => {
        this.getWebServiceId = data;
        localStorage.setItem(
          "dataFromNodeJsId",
          JSON.stringify(this.getWebServiceId)
        );
        console.log(this.getWebServiceId);
      },
      error => console.log(error)
    );
  }

  getDataFromNodeJs() {
    console.log(`getDataFromNodeJs`);
    return this.httpClient.get<Matricula>(this.urlApi);
  }

  getDataFromNodeJsId() {
    let id = 456;
    console.log(`getDataFromNodeJs`);
    return this.httpClient.get<Matricula>(`${this.urlApi}/${id}`);
  }
}
