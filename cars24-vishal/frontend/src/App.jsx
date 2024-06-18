import "./App.css";
import { Route, Routes } from "react-router-dom";
import Hero from "./components/page/hero";
import Header from "./components/page/header";

function App() {
  return (
    <div>
      <Header />
      <Routes>
        <Route exact path="/" element={<Hero />} />
      </Routes>
    </div>
  );
}

export default App;
