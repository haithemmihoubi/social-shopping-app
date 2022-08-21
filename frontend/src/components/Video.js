import ReactPlayer from 'react-player/lazy';
import { motion } from 'framer-motion';

export default function Video() {

  return (
    <motion.div
      initial={{
        opacity: 0,
        x: -500,
      }}
      animate={{
        opacity: 1,
        x: 0,
      }}
      transition={{
        type: 'spring',
        stiffness: 30,
        duration: 0.3
      }}
      className="player-wrapper self-start justify-self-start "
      style={{
        gridRow: '1 / span 3',
        flexShrink: 1,
        maxWidth: '44.72%'
      }}>
      <ReactPlayer
        className="react-player"
        url="a"
        height='100vh'
        width='auto'
        pip={false}
        controls
        style={{
          background: 'grey'
        }}
      >
        
      </ReactPlayer>
    </motion.div>
  );
}
