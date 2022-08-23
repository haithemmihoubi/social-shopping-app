import { Routes, Route } from 'react-router-dom';

import Main from './components/Main';
import NoMatch from './components/NoMatch';

function App() {
  return (
    <Routes>
      <Route path="/:id" element={<Main />} />
      <Route path="" element={<Main />} />
      <Route path="*" element={<NoMatch />} />
    </Routes>
  );
}

export default App;
