import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { VideoModule } from './video/video.module';
import { ProductModule } from './product/product.module';

@Module({
  imports: [
    ConfigModule.forRoot({ isGlobal: true }),
    TypeOrmModule.forRoot({
    /*  type: 'postgres',
      port: 5432,
      host: 'localhost',
      username: 'postgres',
      password: 'admin',
      database: 'products',
      entities: ['dist/!**!/!*.entity{.ts,.js}'],
      synchronize: true,
      autoLoadEntities: true,*/
      type: 'postgres',
      port: 5681,
      host: 'containers-us-west-54.railway.app',
      username: 'postgres',
      password: 'n5Ko8QEFFUbS9LgT7TXe',
      database: 'railway',
      entities: ['dist/!**!/!*.entity{.ts,.js}'],
      synchronize: true,
      autoLoadEntities: true,
    }),
    VideoModule,
    ProductModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
