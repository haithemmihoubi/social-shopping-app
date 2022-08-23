import './Home.css';

import img1 from '../images/img1.jpg'

import ImageGallery from 'react-image-gallery';

const images = [
  {
    original: {img1},
    thumbnail:{img1},
  },
  {
    original: 'public/images/img2',
    thumbnail:'public/images/img2',
  },
  {
    original: 'public/images/img3',
    thumbnail:'public/images/img3',
  },
  {
    original: 'public/images/img4',
    thumbnail:'public/images/img4',
  },
  {
    original: 'public/images/img5',
    thumbnail:'public/images/img5',
  },
];

export default function Home() {

  return (
    <ImageGallery items={images} />
  );
}