import { IsOptional, IsString } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

export class CreateVideoDto {
  @IsOptional()
  id: number;
  @ApiProperty({ description: 'videoLink' })
  @IsString()
  @IsString()
  @IsOptional()
  videoLink: string;
}
