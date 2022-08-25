import { useEffect, useState, useRef } from 'react';
import { motion } from 'framer-motion';

import Product from './Product';

export default function ProductsList({products}) {

  // const [productList] = useState([<Product n="1" delay="0.4" />, <Product n="2" delay=".7" />, <Product n="3" delay="1" />, <Product n="4" delay="1.3" />, <Product n="5" delay="1.6" />, <Product n="6" delay="1.9" />, <Product n="7" delay="2.2" />])
  const [height, setHeight] = useState();
  const carousel = useRef();

  useEffect(() => {
    setHeight(carousel.current.scrollHeight - carousel.current.offsetHeight);
  }, []);

  return (
    <motion.div
      ref={carousel}
      className='overflow-hidden h-full'
      style={{
        paddingLeft: '250px',
        marginLeft: '-250px',
        paddingBlock: '1.875rem'
      }}
    >
      <motion.div
        drag="y"
        dragConstraints={{
          bottom: 0,
          top: -height
        }}
        transition={{
          staggerChildren: .07,
          delayChildren: .2
        }}
        whileDrag={{
          cursor: 'grabbing'
        }}
        className="sliderWrapper flex flex-col items-end justify-center gap-6"
        style={{
          cursor: 'grab'
        }}
      >
        {products && products.map(product =>  <Product product={product}/>)}
      </motion.div>
    </motion.div>
  );
}