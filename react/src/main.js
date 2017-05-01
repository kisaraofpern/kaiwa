import 'babel-polyfill';
import React from 'react';
import ReactDOM from 'react-dom';
import AnimeShowContainer from './containers/animeShowContainer';

$(function() {
  ReactDOM.render(
    <div>
      <AnimeShowContainer />
    </div>,
    document.getElementById('app')
  );
});
