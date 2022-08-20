import Product from './Product';

export default function ProductsList() {

  return (
    <div
      className="h-full flex flex-col items-end gap-6"
      style={{
        paddingBlock: '1.875rem'
      }}
    >
      <Product />
      <Product />
      <Product />
      <Product />
    </div>
  );
}