import { Module } from '@nestjs/common';
import { VideoService } from './video.service';
import { VideoController } from './video.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Video } from './entities/video.entity';
import {ProductModule} from "../product/product.module";

@Module({
  imports: [TypeOrmModule.forFeature([Video]), ProductModule],
  controllers: [VideoController],
  providers: [VideoService],
})
export class VideoModule {}
