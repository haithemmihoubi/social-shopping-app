import Video from './Video';
import Products from './Products';
import LoadingPage from './LoadingPage';

import { useQuery } from 'react-query';
import { useParams } from 'react-router-dom';
import axios from 'axios';

export default function Main() {

  const { id } = useParams();

  const { isLoading, isError, error, data } = useQuery('video', () =>
    axios.get('https://shop-production-3194.up.railway.app/video/' + id)
  );

  if (isLoading) {
    return (
      <LoadingPage />
    )
  }

  if (isError) {
    return (
      <>
        <h1>Error</h1>
        <p>{console.log(error)}</p>
      </>
    )
  }

  return (
    <main>{console.log(data['data'].products)}
      <div
        className="h-screen w-screen flex bg-black overflow-hidden"
        style={{
          background: 'linear-gradient(90deg, rgba(255,37,51,1) 0%, rgba(255,54,129,1) 100%)'
        }}>
        <Video url={data['data'].video.videoLink} />
        <Products products={data['data'].products}/>
      </div>
    </main>
  );
}
