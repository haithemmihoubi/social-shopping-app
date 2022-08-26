import { Routes, Route } from 'react-router-dom';

import {Main} from './containers';
import {NoMatch, Home} from './components';

function App() {
  return (
    <Routes>
      <Route path="/post/:id" element={<Main />} />
      <Route path="/" element={<Home />} />
      <Route path="*" element={<NoMatch />} />
    </Routes>
  );
}

export default App;
