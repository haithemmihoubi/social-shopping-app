import { IsOptional, IsString } from 'class-validator';

export class CreateVideoDto {
  @IsOptional()
  id: number;
  @IsString()
  @IsOptional()
  videoLink: string;
}
