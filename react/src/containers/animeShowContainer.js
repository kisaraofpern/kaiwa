import React, { Component } from 'react';
import AnimePresentationTile from '../components/animePresentationTile'

class AnimeShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      animeObject: null
    };
  }

  componentDidMount() {
    fetch('api/v1/anilistapi')
    .then(anilistResponse => anilistResponse.json())
    .then(anilistData => {
      this.setState({ animeObject: anilistData });
    });
  }

  render() {

    return (
      <div>
        < AnimePresentationTile
          animeObject = {this.state.animeObject}
        />
      </div>
    );
  }

}

export default AnimeShowContainer;
