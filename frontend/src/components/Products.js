import ProductsList from './ProductsList';

export default function Products() {

  return (
    <>
      <div className="bg-yellow-500">
        <h2>LISTE DE PRODUITS</h2>
      </div>
      <ProductsList />
      <div className="bg-green-500"></div>
    </>
  );
}