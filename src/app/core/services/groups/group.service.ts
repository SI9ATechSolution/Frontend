import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Group } from 'src/app/core/models/group.model';

@Injectable({
  providedIn: 'root'
})
export class GroupService {

  public groupList:Group[]=[]

  private apiURL="http://localhost:3000/Group"
  constructor(private http:HttpClient) {
    this.getGroups()
  }

  public getGroups(): Observable<Group[]> {
    return this.http.get<Group[]>(this.apiURL);
  }

  public getGroupByPersonId(id: any): Observable<Group[]> {
    return this.http.get<Group[]>(`${this.apiURL}?Person_id=${id}`);
  }

  public addGroup(group: Group) {
    this.http.post(this.apiURL, group)
    .subscribe(
      (response) => console.log(response),
      (error) => console.log(error)
    );
  }
}