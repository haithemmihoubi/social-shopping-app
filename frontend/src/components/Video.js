import ReactPlayer from 'react-player/lazy';
import { AnimatePresence, motion } from 'framer-motion';
import { useState } from 'react';

import './Video.css';

export default function Video() {

  const [play, setPlay] = useState(false);
  const [playDisplay, setPlayDisplay] = useState(true);
  const [volume, setVolume] = useState(1);

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
      className="player-wrapper self-start justify-self-start"
      style={{
        flexShrink: 1,
        maxWidth: '44.72%'
      }}

    >
      <div onClick={() => { if (!playDisplay) { setPlayDisplay(true); setPlay(false) } }}>
        <ReactPlayer
          playing={play}
          volume={volume}
          className="react-player shadow-xl"
          url="https://v16-webapp.tiktok.com/6f0912fa156dcfb4c0fd0876375c5aff/63032c42/video/tos/useast2a/tos-useast2a-pve-0068/b296ddea27334a84a075457d4f23dba3/?a=1988&ch=0&cr=0&dr=0&lr=tiktok_m&cd=0%7C0%7C1%7C0&cv=1&br=1364&bt=682&cs=0&ds=3&ft=eXd.6H5_Myq8ZSdwVhe2NbVeyl7Gb&mime_type=video_mp4&qs=0&rc=ZTw6O2VkOmhmZTQ2OTk6OEBpanFqamQ6ZjozPDMzNzczM0AyNF4tYV4uXi8xL2JjMV9eYSNlcl8tcjQwY2FgLS1kMTZzcw%3D%3D&l=2022082201111901021713503808780112&btag=80000"
          height='100vh'
          width='auto'
          pip={false}
          style={{
            background: 'rgba(0,0,0,0.1)'
          }}
          loop
        ></ReactPlayer>
      </div>
      <div
        id='controls'
        className='flex justify-center'
        style={{
          height: '0vh',
        }}>
        <div
          style={{
            position: 'fixed',
            bottom: '50%',
            zIndex: 1000
          }}
        >
          <AnimatePresence>
            {playDisplay &&
              <motion.button initial={{}} layout className='rounded-full' onClick={() => { play ? setPlay(false) : setPlay(true); setPlayDisplay(false) }}>
                <svg xmlns="http://www.w3.org/2000/svg" className="aspect-block w-32" fill="none" viewBox="0 0 24 24" stroke="white" stroke-width="2">
                  <motion.path initial={{ pathLength: 0, opacity: 0 }} animate={{ pathLength: 1, opacity: 1, transition: { delay: .1, duration: .5 } }} exit={{ pathLength: 0, opacity: 0, transition: { delay: 0.1 } }} stroke-linecap="round" stroke-linejoin="round" d="M14.752 11.168l-3.197-2.132A1 1 0 0010 9.87v4.263a1 1 0 001.555.832l3.197-2.132a1 1 0 000-1.664z" />
                  <motion.path initial={{ pathLength: 0, opacity: 0 }} animate={{ pathLength: 1, opacity: 1, transition: { delay: .1, duration: .5 } }} exit={{ pathLength: 0, opacity: 0, transition: { delay: 0.1 } }} stroke-linecap="round" stroke-linejoin="round" d="M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
              </motion.button>
            }
          </AnimatePresence>
        </div>
        <AnimatePresence>
          {!playDisplay &&
            <motion.div className='flex flex-col items-center text-xl'
              initial={{ opacity: 0, y: '-50' }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0, y: '50' }}
              style={{ position: 'fixed', bottom: 0 }}
              onClick={() => { }}
            >
              <label className='text-xs tracking-widest text-white outilne-black'
                style={{ position: 'absolute' }}
              >volume</label>
              <div className='z-10'>
                <input
                  id='volumeSlider'
                  type="range"
                  min={0}
                  max={1}
                  step=".02"
                  volume={volume}
                  onChange={({ target }) => { setVolume(target.value) }}
                />
              </div>
            </motion.div>
          }
        </AnimatePresence>
      </div>
    </motion.div >
  );
}
