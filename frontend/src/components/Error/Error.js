import {motion, AnimatePresence} from 'framer-motion';
import {Link} from "react-router-dom";

export default function Error() {

  return (
    <div
      className="h-screen flex justify-center pt-20 text-center select-none overflow-hidden"
      style={{
        color: '#F5C8C6',
        textShadow: '0 0 15px rgba(0,0,0,0.2)'
      }}>
      <AnimatePresence>
        <div>
          <motion.h2
            initial={{scale:0,opacity:0,y:-100}} animate={{scale:1,opacity:1,y:0}}
            transition={{delay: .4, duration: .4, type: 'spring'}}
            className="text-9xl uppercase">Error</motion.h2>
          <motion.p
            initial={{scale:0,opacity:0,y:10}} animate={{scale:1,opacity:1,y:0}}
            transition={{delay: .6, duration: .4, type: 'spring'}}
            className="text-2xl">Request Failed</motion.p>
          <motion.div
            initial={{scale: 0, opacity: 0, rotate: -90}} animate={{scale:1,opacity:1,rotate: 0}}
            transition={{delay:1,duration:.4,type:'spring'}}
          >
            <motion.button
              whileHover={{scale: 1.05}} whileTap={{scale: 0.95}}
              className="px-4 py-2 bg-[#F5C8C6] text-red-500 m-10 rounded-xl shadow-md"
            >
              <Link to="/" replace>Go to Home Page</Link>
            </motion.button>
          </motion.div>
        </div>
      </AnimatePresence>
    </div>
  );
}