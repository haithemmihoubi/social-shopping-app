import ProductsList from './ProductsList';

export default function Products() {

  return (
    <div className='h-full flex flex-col pr-10 bg-green-400' style={{
      flexShrink: 1.1,
      flexBasis: 'auto',
      flexGrow: 1
    }}>
      <div className="" style={{
        height: '9.625rem'
      }}>
        
      </div>
      <ProductsList />
      <div className="" style={{
        height: '9.3125rem'
      }}>

      </div>
    </div>
  );
}