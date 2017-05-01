import React, { Component } from 'react';

class AnimePresentationTile extends Component {
  constructor(props) {
    super(props);

  }

  render() {
    let animeTileComponent;
    let id = this.props.id;
    if (this.props.animeObject === null) {
      animeTileComponent = <div>Loading...</div>
    } else {
      if (this.props.id = this.props.activeTile) {
        animeTileComponent =
          <div>
            <div className="left columns small-3 medium-3 large-3">
              <img src={this.props.animeObject.image_url_lge} id={id} />
            </div>
            <div className="right columns small-9 medium-9 large-9">
              <p>
                <strong>Title (Japanese): </strong>{this.props.animeObject.title_japanese}<br />
                <strong>Title (Romaji): </strong>{this.props.animeObject.title_romaji}<br />
                <strong>Title (English): </strong>{this.props.animeObject.title_english}<br />
                <strong>Description: </strong>{this.props.animeObject.description}<br />
                <strong>Genres: </strong>{this.props.animeObject.genres.join(", ")}<br />
              </p>
            </div>
          </div>
        } else {
          animeTileComponent =
            <div>
              <div className="left columns small-3 medium-3 large-3">
                <img src={this.props.animeObject.image_url_lge} id={id} />
              </div>
            </div>
        }
      }

    return (
      <div onClick={this.props.clickEvent} className="foo">
        {animeTileComponent}
      </div>
    )
  }


}

export default AnimePresentationTile
