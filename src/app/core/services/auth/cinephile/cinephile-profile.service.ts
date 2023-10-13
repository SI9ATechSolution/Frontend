import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, of, switchMap } from 'rxjs';
import { User } from 'src/app/core/models/user-profile.model';

@Injectable({
  providedIn: 'root'
})
export class CinephileProfileService {

  constructor(private _http: HttpClient) {}

  //General
  signUpPerson(data: User): Observable<any>{
    return this._http.post('http://localhost:8080/api/TuCine/v1/users/auth/sign-up',data);
  }

  addPerson(data: User): Observable<any>{
    return this._http.post('http://localhost:8080/api/TuCine/v1/users/auth/sign-up',data);
  }

  getPersonList(): Observable<any>{
    return this._http.get('https://backend-production-3909.up.railway.app/api/TuCine/v1/users');
  }

  //Gender
  getUserGender(): Observable<any>{
    return this._http.get('http://localhost:8080/api/TuCine/v1/genders');
  }

  //Customer
  addCustomer(data: any): Observable<any>{
    return this._http.post('https://backend-tucine-production.up.railway.app/api/TuCine/v1/customers',data);
  }
  getCustomerList(): Observable<any>{
    return this._http.get('https://backend-tucine-production.up.railway.app/api/TuCine/v1/customers');
  }

  //Owner
  getBusinessTypeList(): Observable<any>{
    return this._http.get('https://backend-tucine-production.up.railway.app/api/TuCine/v1/businessTypes');
  }

  addOwner(data: any): Observable<any>{
    return this._http.post('https://backend-tucine-production.up.railway.app/api/TuCine/v1/owners',data);
  }

  addBusiness(data: any):Observable<any>{
    return this._http.post('https://backend-tucine-production.up.railway.app/api/TuCine/v1/businesses',data);
  }

  validateCredentials(email: string, password: string): Observable<any>{
    return this.getPersonList().pipe(
      switchMap((userList: any[]) => {
        const user = userList.find(user => user.email === email);
  
        if (user && user.password === password) {
          // Las credenciales coinciden
          return of({ valid: true, user: user });
        } else {
          // Las credenciales no coinciden
          return of({ valid: false, user: null });
        }
      })
    );
  }

}
