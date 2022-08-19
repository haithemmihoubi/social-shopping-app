import { Routes, Route } from 'react-router-dom';

import Main from './components/Main';

function App() {
  return (
    <Routes>
      <Route path="/post/:id" element={<Main />} />
      <Route path="*" />
    </Routes>
  );
}

export default App;
