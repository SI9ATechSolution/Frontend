import { Component, Input } from '@angular/core';
import { FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute } from '@angular/router';
import { Review, ReviewCineclub } from 'src/app/core/models/review.models';
import { Business } from 'src/app/core/models/user-profile.model';
import { FilmsProfileService } from 'src/app/core/services/film/films-profile.service';
import { ReviewService } from 'src/app/core/services/review/review.service';

@Component({
  selector: 'app-cineclub-detail',
  templateUrl: './cineclub-detail.component.html',
  styleUrls: ['./cineclub-detail.component.scss']
})
export class CineclubDetailComponent {
  idPost: any;
  cineclub!: Business;
  reviewForm!: FormGroup;
  p:number=1;
  public userReviews:Review[]=[];

  constructor(
    private _fb: FormBuilder,
    private _empServiceMovie: FilmsProfileService ,
    private reviewService: ReviewService,
    //private _empServiceCineclub: CineclubService,
    private route : ActivatedRoute,
  ){
    this.idPost = this.route.snapshot.paramMap.get('id');
    this.reviewForm = this._fb.group(
      {
        comment: new FormControl('', [Validators.required, Validators.maxLength(250),]),
        rating: ['', Validators.required]
      }
    );
    this.getAllReviews();
  }

  reviewCineclub: ReviewCineclub = {
    id: 0,
    comment: '',
    rating: 0,
    user: {
      id: 0
    },
    business: {
      id: 0
    }
  }


  saveReview() {
    if (this.reviewForm.valid) {
      const formValue = { ...this.reviewForm.value };

      this.reviewCineclub.comment = formValue.comment;
      this.reviewCineclub.rating = formValue.rating;
      this.reviewCineclub.user.id = JSON.parse(localStorage.getItem("userResult") || '{}').id;
      this.reviewCineclub.business.id = this.idPost;
      console.log(this.reviewCineclub.user.id);
    }

    this.reviewService.postReview(this.reviewCineclub).subscribe({
      next: (addedReview: any) => {
        alert('Review successfully created');
      },
      error: (error: any) => {
        console.error(error);
      }
    })
  }

  getAllReviews() {
    this.reviewService.getReviewsByBusinessId(this.idPost)
      .subscribe((data: any) => {
        this.userReviews = data;
      }
      );
  }
}