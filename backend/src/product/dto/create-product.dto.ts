import { IsOptional, IsString } from 'class-validator';

export class CreateProductDto {
  @IsOptional()
  id: number;
  @IsString()
  image: string;
  @IsString()
  productName: string;
  @IsString()
  productLink: string;
  @IsString()
  mark: string;
  @IsString()
  hashtag: string;
  @IsString()
  label: string;
}
