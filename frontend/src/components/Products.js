import ProductsList from './ProductsList';
import ProductsFooter from './ProductsFooter';

import { motion } from 'framer-motion';

export default function Products({products}) {

  return (
    <div className='h-full flex flex-col pr-6' style={{
      flexShrink: 1.1,
      flexBasis: 'auto',
      flexGrow: 1,
    }}>
      <div className="flex justify-end items-end pr-8 mb-4"
        style={{
          height: '9.625rem'
        }}>
        <motion.h2
          className='text-white text-2xl underline tracking-wider font decoration-white decoration-from-font underline-offset-3 cursor-default select-none'
          
          initial={{
            scale: 0,
            opacity: 0,
            y: -10
          }}
          animate={{
            scale: 1,
            opacity: 1,
            y: 0
          }}
          transition={{
            type: 'spring',
            duration: .6,
            delay: .3
          }}
          >
          LISTE DE PRODUITS
        </motion.h2>
      </div>
      <ProductsList products={products} />
      <div
        className="flex justify-end gap-10 pr-32 items-start mt-8"
        style={{
          height: '9.3125rem'
        }}>
        <ProductsFooter />
      </div>
    </div>
  );
}