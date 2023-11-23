import { Component, OnInit, ViewChild  } from '@angular/core';
import { FilmsProfileService } from 'src/app/core/services/film/films-profile.service';
import { ActivatedRoute } from '@angular/router';
import { DomSanitizer } from '@angular/platform-browser';
import { Film } from 'src/app/core/models/film.model';
import { MatTableDataSource } from '@angular/material/table';
import { Showtime } from 'src/app/core/models/showtime.model';
import { MatSort } from '@angular/material/sort';
import { MatPaginator } from '@angular/material/paginator';
import { MatDialog } from '@angular/material/dialog';
import { BookTicketComponent } from '../book-ticket/book-ticket.component';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.scss']

})
export class ProfileComponent implements OnInit {
  idPost: any;
  FilmProfile!: Film;
  panelOpenState = false;
  ActorList: any[] = [];
  url!: string;

  @ViewChild(MatSort) sort!: MatSort;
  @ViewChild(MatPaginator) paginator!: MatPaginator;

   constructor(
    private _servMoviesProfile: FilmsProfileService,
    private route : ActivatedRoute,
    private sanitizer: DomSanitizer,
    private _dialog: MatDialog
   ){
    this.idPost = this.route.snapshot.paramMap.get('id');
   }

  ngOnInit(): void {
    this.getMoviebyId(this.idPost);
    this.getActorListbyFilmId(this.idPost);
  }

  getMoviebyId(id: number){
    this._servMoviesProfile.getMoviebyId(id).subscribe((res) => {
      this.FilmProfile = res;
      this.getSafeTrailerUrl();
    }, (err) => { console.log(err); }
    );
  }

  getSafeTrailerUrl() {
    this.url = this.FilmProfile.trailer;
    if (this.url.startsWith('https://www.youtube.com/watch?v=')) {
      this.url = this.url.replace('https://www.youtube.com/watch?v=', 'https://www.youtube.com/embed/');
    } else if (this.url.startsWith('https://youtu.be')) {
      var temp = this.url.split('?si=');
      this.url = temp[0];
      this.url = this.url.replace('https://youtu.be/', 'https://www.youtube.com/embed/');
    }
    return this.sanitizer.bypassSecurityTrustResourceUrl(this.url);
  } 

  // Detalles de la pelicula
  getActorListbyFilmId(Film_id: number) {
    return this._servMoviesProfile.getFilmActorbyFilmId(Film_id).subscribe((res) => {
      
      res.forEach((element: any) => { 
          element.Actor = element.firstName + " " + element.lastName;
          this.ActorList.push(element);
      });
    }, (err) => { console.log(err); }
    );
  }
}

