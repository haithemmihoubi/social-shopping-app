import Video from './Video';
import Products from './Products';

export default function Main () {
  return (
    <main>
      <div className="h-screen w-screen grid" style={gridStyles}>
        <Video />
        <Products />
      </div>
    </main>
  );
}

const gridStyles = {
  gridTemplateColumns: '44.72% 1fr',
  gridTemplateRows: '9.625rem 1fr 9.3125rem'
}