import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { VideoService } from './video.service';
import { CreateVideoDto } from './dto/create-video.dto';
import { UpdateVideoDto } from './dto/update-video.dto';
import { ProductService } from '../product/product.service';
import { Product } from '../product/entities/product.entity';
import { Video } from './entities/video.entity';
import { json } from 'express';

@Controller('video')
export class VideoController {
  constructor(
    private readonly videoService: VideoService,
    private readonly productService: ProductService,
  ) {}

  @Post('upload')
  async createSocial(@Body() data: any) {
    const videoEntity = new Video();
    videoEntity.videoLink = data.videoLink;
    const newVideo = await this.videoService.create(videoEntity);

    const productList = data.products as Product[];
    productList.forEach((product) => {
      const newProduct = new Product();
      newProduct.image = product.image;
      newProduct.productName = product.productName;
      newProduct.productLink = product.productLink;
      newProduct.mark = product.mark;
      newProduct.hashtag = product.hashtag;
      newProduct.label = product.label;
      newProduct.video = newVideo;
      this.productService.create(newProduct);
    });
    return {
      video: newVideo,
      products: productList,
    };
  }
  @Post()
  create(@Body() createVideoDto: CreateVideoDto) {
    return this.videoService.create(createVideoDto);
  }

  @Get()
  findAll() {
    return this.videoService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.videoService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateVideoDto: UpdateVideoDto) {
    return this.videoService.update(+id, updateVideoDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.videoService.remove(+id);
  }
}
