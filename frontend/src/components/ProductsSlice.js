import { createSlice } from "@reduxjs/toolkit";

const initialState = {
  start: 0,
  finish: 2,
  length: 7,
  isTop: true,
  isDown: false,
}

export const ProductsSlice = createSlice({
  name: 'ProductsList',
  initialState,
  reducers: {
    addLength: (state, action) => {
      state.length = action.payload;
    },
    slideDown: state => {     
      if (state.finish < state.length) {
        state.start += 1;
        state.finish += 1;
        state.isTop = true;
      } else state.isTop = false;
    },
    slideUp: state => {   
      if (state.start > 0) {
        state.start -= 1;
        state.finish -= 1;
        state.isDown = true;
      } else state.isDown = false;
    },
    addFinishPosition: (state, action) => {
      state.finish = action.payload;
    },
  }
})

export const { addLength, slideDown, slideUp, addFinishPosition } = ProductsSlice.actions;

export default ProductsSlice.reducer;