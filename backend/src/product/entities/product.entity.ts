import {Column, Entity, ManyToOne, PrimaryGeneratedColumn} from 'typeorm';
import { Video } from '../../video/entities/video.entity';

@Entity()
export class Product {
  @PrimaryGeneratedColumn()
  id: number;
  @Column()
  image: string;
  @Column()
  productName: string;
  @Column()
  productLink: string;
  @Column()
  mark: string;
  @Column()
  hashtag: string;
  @Column()
  label: string;
  @ManyToOne(() => Video, (video) => video.products)
  video: Video;
}
