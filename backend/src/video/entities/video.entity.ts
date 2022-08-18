import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';
import { Product } from '../../product/entities/product.entity';

@Entity()
export class Video {
  @PrimaryGeneratedColumn()
  id: number;
  @Column({ length: 100000 })
  videoLink: string;
  @OneToMany(() => Product, (product) => product.video)
  products: Product[];
}
