import Video from './Video';
import Products from './Products';

export default function Main () {
  return (
    <main>
      <div className="h-screen w-screen flex bg-black overflow-hidden" style={{
        background: 'linear-gradient(90deg, rgba(255,37,51,1) 0%, rgba(255,54,129,1) 100%)'
      }}>
        <Video />
        <Products />
      </div>
    </main>
  );
}
