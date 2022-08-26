import {Video, LoadingPage, Error} from '../../components';
import Products from "../ProductsPage/Products";

import { useQuery } from 'react-query';
import { useParams } from 'react-router-dom';
import axios from 'axios';

export default function Main() {

  const { id } = useParams();

  const { isLoading, isError, data } = useQuery('video', () =>
    axios.get('https://shop-production-3194.up.railway.app/video/' + id)
  );

  // return <Error />;

  if (isLoading) {
    return (
      <LoadingPage />
    )
  }

  if (isError) {
    return (
      <>
        <Error />
      </>
    )
  }

  return (
    <main>
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
