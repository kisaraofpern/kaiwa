import React, { Component } from 'react';

class AnimePresentationTile extends Component {
  constructor(props) {
    super(props);
  }

  render() {
    let animeTileComponent;

    if (this.props.animeObject === null) {
      animeTileComponent = <div>Loading...</div>
    } else {
      animeTileComponent =
        <div className="gallery">
          <div className="tile">
            <div className="content">
              <div className="front">
                <img src={this.props.animeObject.image_url_lge} />
              </div>
            </div>
          </div>
        </div>
    }



    return (
      <div>
        {animeTileComponent}
      </div>
    )
  }


}

export default AnimePresentationTile
