
//export interface CineClub {
  //id:       number;
  //title:    string;
  //subtitle: string;
  //points:   number;
  //image:    string;
//}
// New Models

export interface BusinessType{
  id:       number;
  name:    string;
}

export interface Business {
  id: any,
  name: string;
  social_reason: string;
  RUC: string;
  phone: string;
  email: string;
  image_logo: string;
  image_banner: string;
  description: string;
  date_attention: string;
  address: string;
  reference_address: string;
  Owner_id: number;
  BusinessType_id: any;
}
