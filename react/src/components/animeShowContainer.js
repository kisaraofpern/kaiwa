import React, { Component } from 'react';

class AnimeShowContainer extends Component {
  constructor(props) {
    super(props);
    this.state = {
      animeObject: null
    };
  }

  componentDidMount() {
    let ANILIST_CLIENT_ID = process.env.ANILIST_CLIENT_ID;
    let ANILIST_CLIENT_SECRET = process.env.ANILIST_CLIENT_SECRET;

    let url = new URL("https://anilist.co/api/"),
      params = {
        grant_type: "client_credentials",
        client_id: ANILIST_CLIENT_ID,
        client_secret: ANILIST_CLIENT_SECRET
      };
    Object.keys(params).forEach(key => url.searchParams.append(key, params[key]));
    debugger;
    fetch(url)
      .then(response => response.json())
      .then(responseData => {
        debugger;
        this.setState({ animeObject: responseData });
      });
  }

  render() {
    return (
      <div>
        {this.state.animeObject}
      </div>
    );
  }

}

export default AnimeShowContainer;
