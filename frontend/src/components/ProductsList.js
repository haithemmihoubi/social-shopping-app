import Product from './Product';

export default function ProductsList() {

  return (
    <div className="h-full py-8 flex flex-col items-end gap-6" style={{ gridRow: '2 / span 1' }}>
      <Product />
      <Product />
      <Product />
      <Product />
    </div>
  );
}