import { AnimatePresence, motion } from 'framer-motion';

const variants = {
  initial: {
    opacity: 0
  },
  animate: {
    opacity: 1
  },
  exit: {
    opacity: 0
  },
  transition: {
    duration: 1
  },
  layout : true
}

export default function Product({ n }) {

  return (
    <AnimatePresence>
      <motion.div
        variants={variants}
        className="bg-white relative rounded-2xl shadow-xl"
        style={{
          background: 'linear-gradient(90deg, rgba(189,88,107,1) 0%, rgba(243,60,134,1) 100%)',
          width: '47.5rem',
          height: '10rem',
          zIndex: 1000,
          left: '-2rem'
        }}>
        {n}
      </motion.div>
    </AnimatePresence>
  );
}

  