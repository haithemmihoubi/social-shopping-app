import ProductsList from './ProductsList';

export default function Products() {

  return (
    <div className='h-full flex flex-col pr-6' style={{
      flexShrink: 1.1,
      flexBasis: 'auto',
      flexGrow: 1,
    }}>
      <div className="flex justify-end items-end pr-8" 
        style={{
        height: '9.625rem'
      }}>
        <h2 className='text-white text-2xl underline decoration-white decoration-from-font underline-offset-3 cursor-default select-none'>LISTE DE PRODUITS</h2>
      </div>
      <ProductsList />
      <div className="" style={{
        height: '9.3125rem'
      }}>

      </div>
    </div>
  );
}