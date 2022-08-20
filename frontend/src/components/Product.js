import { AnimatePresence, motion } from 'framer-motion';

export default function Product({ n, delay }) {

  return (
    <AnimatePresence>
      <motion.div
        layout
        initial={{
          opacity: 0,
          x: 1000
        }}
        animate={{
          opacity: 1,
          x: 0
        }}
        exit={{
          opacity: 0,
          x: 1000
        }}
        transition={{
          duration: .7,
          delay: delay,
          type: 'spring'
        }}
        className="bg-white relative rounded-2xl shadow-xl grid text-white"
        style={{
          background: 'linear-gradient(90deg, rgba(189,88,107,1) 0%, rgba(243,60,134,1) 100%)',
          width: '47.5rem',
          height: '10rem',
          zIndex: 1000,
          left: '-2rem',
          gridTemplateColumns: "1fr 2fr 2fr",
        }}>

        <div className='h-full p-4'>
          <motion.div 
          className='rounded-2xl text-black bg-white aspect-square w-full flex justify-center items-center'
          whileHover={{
            scale: 1.1
          }}
          >
            <img alt='product' src='#' />
          </motion.div>
        </div>
        <div className='h-full flex flex-col justify-center p-4'>
          <h3 className='font-bold pb-4'>Product {n}</h3>
          <p className='text-sm '>Product description description description</p>
        </div>
        <div className='h-full flex justify-center items-center'>
          <motion.button
          className='rounded-md px-14'
          style={{
            background: '#F5C8C6',
            color: '#BC5B6C',
            paddingBlock: '.1rem'
          }}
          whileHover={{
            scale: 1.05
          }}
          whileTap={{
            scale: .95
          }}
          drag
          dragConstraints={{
            top:0,bottom:0,left:0,right:0
          }}
          >
            Voir Produit
          </motion.button>
        </div>
      </motion.div>
    </AnimatePresence>
  );
}

