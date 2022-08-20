import { useDispatch } from "react-redux";
import { slideDown, slideUp } from "./ProductsSlice";
import { motion } from 'framer-motion';

export default function ProductsFooter() {

  const dispatch = useDispatch();

  return (
    <>
      <AnimatedButton onClick={() => dispatch(slideUp())}>
        <div className='arrow-up rounded-full w-16 aspect-square shadow-xl p-3'
          style={background}>
          <svg xmlns="http://www.w3.org/2000/svg" className='w-full' fill="white" class="bi bi-chevron-double-up" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M7.646 2.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 3.707 2.354 9.354a.5.5 0 1 1-.708-.708l6-6z" />
            <path fill-rule="evenodd" d="M7.646 6.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1-.708.708L8 7.707l-5.646 5.647a.5.5 0 0 1-.708-.708l6-6z" />
          </svg>
        </div>
      </AnimatedButton>
      <AnimatedButton onClick={() => dispatch(slideDown())}>
        <div className='arrow-down rounded-full w-16 aspect-square shadow-xl p-3'
          style={background}>
          <svg xmlns="http://www.w3.org/2000/svg" className='w-full' fill="white" class="bi bi-chevron-double-down" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M1.646 6.646a.5.5 0 0 1 .708 0L8 12.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
            <path fill-rule="evenodd" d="M1.646 2.646a.5.5 0 0 1 .708 0L8 8.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
          </svg>
        </div>
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
    dragConstraints={{top:0,bottom:0,left:0,right:0}}
    >
      {props.children}
    </motion.button>
  );
}

const background = { background: '#f52f54' }