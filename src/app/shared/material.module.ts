import { NgModule } from '@angular/core';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import {MatButtonModule} from '@angular/material/button';
import {MatToolbarModule} from '@angular/material/toolbar';
import {MatIconModule} from '@angular/material/icon';
import {MatTableModule} from '@angular/material/table';
import {MatPaginatorModule} from '@angular/material/paginator';
import {MatFormFieldModule} from '@angular/material/form-field';
import {MatInputModule} from '@angular/material/input';
import {MatChipsModule} from '@angular/material/chips';
import {MatGridListModule} from '@angular/material/grid-list';
import { FormsModule } from '@angular/forms';
import { MatDatepickerModule } from '@angular/material/datepicker';

import {MatTabsModule} from '@angular/material/tabs';
import {MatDialogModule} from '@angular/material/dialog';
import {MatSelectModule} from '@angular/material/select';
import { ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { MatSortModule } from '@angular/material/sort';
import {MatSnackBarModule} from '@angular/material/snack-bar';
import { RouterModule } from '@angular/router';
import {FlexLayoutModule} from '@angular/flex-layout';
import {MatButtonToggleModule} from '@angular/material/button-toggle';
import { GooglePlaceModule } from 'ngx-google-places-autocomplete';
import { MatCardModule } from '@angular/material/card';
import { NgxPaginationModule } from 'ngx-pagination';


@NgModule({
  imports: [
    BrowserAnimationsModule,
    MatButtonModule,
    MatToolbarModule,
    MatIconModule,
    MatTableModule,
    MatPaginatorModule,
    MatFormFieldModule,
    MatInputModule,
    MatChipsModule,
    MatGridListModule,
    MatTabsModule,
    MatDatepickerModule,
    MatDialogModule,
    MatSelectModule,
    ReactiveFormsModule,
    HttpClientModule,
    MatSortModule,
    MatSnackBarModule,
    RouterModule,
    MatCardModule,
    FlexLayoutModule,
    MatButtonToggleModule,
    GooglePlaceModule,
    FormsModule,
    NgxPaginationModule,
  ],
  exports:[
    BrowserAnimationsModule,
    MatButtonModule,
    MatToolbarModule,
    MatIconModule,
    MatTableModule,
    MatPaginatorModule,
    MatFormFieldModule,
    MatInputModule,
    MatChipsModule,
    MatGridListModule,
    MatTabsModule,
    MatDialogModule,
    MatSelectModule,
    ReactiveFormsModule,
    HttpClientModule,
    MatSortModule,
    MatSnackBarModule,
    RouterModule,
    MatCardModule,
    FlexLayoutModule,
    MatButtonToggleModule,
    GooglePlaceModule,
    MatDatepickerModule,
    FormsModule
  ]
})
export class MaterialModule {}
