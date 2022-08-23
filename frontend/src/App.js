import { Routes, Route } from 'react-router-dom';

import Main from './components/Main';
import NoMatch from './components/NoMatch';
import Home from './components/Home';

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
