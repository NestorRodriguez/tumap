import { Injectable } from '@angular/core';
import { HttpClient, HttpParams, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class LoginService {

  constructor(public http: HttpClient) { }

  login(user){
      let urlService = 'https://tumap.azurewebsites.net/users/';
      return new Promise(resolve => {
        return this.http.get(urlService)
          .subscribe(
            data => {
              resolve(data);
            }, err => {
              if (err.status === 0)
              {
                resolve(err.status);
              }
              else
              {
                resolve(null);
              }
            });
      });
  }
}
