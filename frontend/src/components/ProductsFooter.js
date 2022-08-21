import { motion, AnimatePresence } from 'framer-motion';

export default function ProductsFooter() {

  return (
    <>
      <AnimatedButton onClick={() => {}}>
        <AnimatePresence>
          <motion.div
            className='arrow-down rounded-full w-16 aspect-square shadow-xl p-3'
            style={background}
            initial={{
              scale: 0,
              y: 200,
            }}
            animate={{
              scale: 1,
              y: 0,
              rotate: 360
            }}
            transition={{
              type: 'spring',
              duration: 1.2,
              delay: .3
            }}
          >
            <svg xmlns="http://www.w3.org/2000/svg" className='w-full' fill="white" class="bi bi-chevron-double-down" viewBox="0 0 16 16">
              <path fill-rule="evenodd" d="M1.646 6.646a.5.5 0 0 1 .708 0L8 12.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
              <path fill-rule="evenodd" d="M1.646 2.646a.5.5 0 0 1 .708 0L8 8.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
            </svg>
          </motion.div>
        </AnimatePresence>
      </AnimatedButton>
    </>
  );
}

const AnimatedButton = props => {

  return (
    <motion.button
      onClick={props.onClick}
      whileHover={{
        scale: .95
      }}
      whileTap={{
        scale: .89,
      }}
      drag
      dragConstraints={{ top: 0, bottom: 0, left: 0, right: 0 }}
    >
      {props.children}
    </motion.button>
  );
}

const background = { background: '#f52f54' }