import { IsOptional, IsString } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

export class CreateProductDto {
  @IsOptional()
  id: number;
  @ApiProperty({ description: 'image' })
  @IsString()
  image: string;
  @ApiProperty({ description: 'productName' })
  @IsString()
  productName: string;
  @ApiProperty({ description: 'productLink' })
  @IsString()
  productLink: string;
  @ApiProperty({ description: 'mark' })
  @IsString()
  mark: string;
  @ApiProperty({ description: 'hashtag' })
  @IsString()
  hashtag: string;
  @ApiProperty({ description: 'label' })
  @IsString()
  label: string;
}
