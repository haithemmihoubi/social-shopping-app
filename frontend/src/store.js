import { configureStore } from '@reduxjs/toolkit'
import ProductsSlice from './components/ProductsSlice'

export const store = configureStore({
  reducer: {
    'ProductsList': ProductsSlice,
  },
})
