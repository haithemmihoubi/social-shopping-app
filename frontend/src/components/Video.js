import ReactPlayer from 'react-player';
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
        url="https://firebasestorage.googleapis.com/v0/b/social-d7fb2.appspot.com/o/videos%2FScreen_Recording_20220820-005309.mp4?alt=media&token=036bb569-4780-4b4a-95dc-53d1089f2556"
        height='100vh'
        width='auto'
        pip={false}
        controls
      >
        
      </ReactPlayer>
    </motion.div>
  );
}
