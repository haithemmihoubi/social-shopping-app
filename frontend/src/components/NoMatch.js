
import { motion } from 'framer-motion'

export default function NoMatch() {

  return (
    <div className="h-screen w-screen flex justify-center items-center text-center">
      <motion.svg
        variants={variant}
        initial="hidden"
        animate="show"
        className="h-full"
        xmlns="http://www.w3.org/2000/svg"
        viewBox="0 0 512 512"
        style={{
          enableBackground: "new 0 0 512 512",
        }}
        xmlSpace="preserve"
        stroke="black"
      >
        <motion.path variants={childrenVariant} transition={{duration: .5}} d="M170.489 307.841h-9.086v-86.046a8.017 8.017 0 0 0-16.034 0v86.046h-42.235l15.383-84.612a8.018 8.018 0 0 0-15.775-2.868L85.64 314.424a8.015 8.015 0 0 0 7.888 9.45h51.841v17.637a8.017 8.017 0 0 0 16.034 0v-17.637h9.086a8.017 8.017 0 0 0 0-16.033zM418.472 307.841h-9.086v-86.046a8.017 8.017 0 0 0-16.034 0v86.046h-42.235l15.384-84.612a8.018 8.018 0 0 0-15.775-2.868l-17.102 94.063a8.016 8.016 0 0 0 7.888 9.45h51.841v17.637a8.017 8.017 0 0 0 16.034 0v-17.637h9.086a8.017 8.017 0 1 0-.001-16.033zM256 213.779c-32.711 0-59.324 26.612-59.324 59.324v68.409c0 2.778 1.439 5.358 3.802 6.82s5.315 1.594 7.8.351l13.517-6.759 13.517 6.759a8.013 8.013 0 0 0 7.17 0l13.518-6.76 13.517 6.759a8.013 8.013 0 0 0 7.17 0l13.517-6.759 13.517 6.759a8.015 8.015 0 0 0 11.602-7.17v-68.409c.001-32.712-26.612-59.324-59.323-59.324zm43.29 114.761-5.501-2.75a8.013 8.013 0 0 0-7.17 0l-13.517 6.759-13.517-6.759a8.02 8.02 0 0 0-7.17 0l-13.517 6.759-13.517-6.759a8.013 8.013 0 0 0-7.17 0l-5.5 2.75v-55.438c0-23.871 19.42-43.29 43.29-43.29s43.29 19.42 43.29 43.29v55.438z" />
        <motion.path variants={childrenVariant} transition={{duration: .5}} d="M238.898 256.534a8.017 8.017 0 0 0-8.017 8.017v8.551a8.017 8.017 0 0 0 16.034 0v-8.551a8.018 8.018 0 0 0-8.017-8.017zM273.102 256.534a8.017 8.017 0 0 0-8.017 8.017v8.551a8.017 8.017 0 0 0 16.034 0v-8.551a8.017 8.017 0 0 0-8.017-8.017z" />
        <motion.path variants={childrenVariant} transition={{duration: .5}} d="M478.33 51.307H33.67C15.105 51.307 0 66.411 0 84.977v342.046c0 18.566 15.105 33.67 33.67 33.67h444.66c18.566 0 33.67-15.105 33.67-33.67V84.977c0-18.566-15.105-33.67-33.67-33.67zm17.637 375.716c0 9.725-7.912 17.637-17.637 17.637H33.67c-9.725 0-17.637-7.912-17.637-17.637V135.749h479.933v291.274zm0-307.307H16.033V84.977c0-9.725 7.912-17.637 17.637-17.637h444.66c9.725 0 17.637 7.912 17.637 17.637v34.739z" />
        <motion.path variants={childrenVariant} transition={{duration: .5}} d="M469.779 85.511H127.733a8.017 8.017 0 0 0 0 16.034h342.046a8.017 8.017 0 0 0 0-16.034z" />
        <motion.circle variants={childrenVariant} transition={{duration: .5}} cx={42.221} cy={93.528} r={8.017} />
        <motion.circle variants={childrenVariant} transition={{duration: .5}} cx={67.875} cy={93.528} r={8.017} />
        <motion.circle variants={childrenVariant} transition={{duration: .5}} cx={93.528} cy={93.528} r={8.017} />
      </motion.svg>
    </div>
  );
}

const variant = {
  hidden: {
    opacity: 0
  },
  show: {
    opacity: 1,
    transition: {
      staggerChildren: .5,
      delay: 0.5
    }
  }
}

const childrenVariant = {
  hidden: {
    pathLength: 0,
    opacity: 0
  },
  show: {
    pathLength: 1,
    opacity: 1,
  },
}