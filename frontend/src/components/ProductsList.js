import { useEffect, useState } from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { addFinishPosition } from './ProductsSlice';
import { motion } from 'framer-motion';

import Product from './Product';

export default function ProductsList() {
  
  const [productList] = useState([<Product n="1" delay="0.4" />,<Product n="2" delay=".7" />,<Product n="3" delay="1" />,<Product n="4" delay="1.3" />,<Product n="5" delay="1.6" />,<Product n="6" delay="1.9" />,<Product n="7" delay="2.2" />])
  const productsPosition = useSelector((state) => state.ProductsList);

  const dispatch = useDispatch();

  useEffect(() => {
    if (window.innerHeight > 1200) {
      dispatch(addFinishPosition(5))
    } else if (window.innerHeight > 1000) {
      dispatch(addFinishPosition(4));
    } else if (window.innerHeight > 800){
      dispatch(addFinishPosition(3));
    } else if (window.innerHeight > 610) {
      dispatch(addFinishPosition(2));
    }
  }, [])

  return (
    <motion.div
      transition={{
        staggerChildren: .07,
        delayChildren: .2
      }}
      className="h-full flex flex-col items-end justify-center gap-6"
      style={{
        paddingBlock: '1.875rem'
      }}
    >
      {productList.slice(productsPosition.start, productsPosition.finish)}
    </motion.div>
  );
}