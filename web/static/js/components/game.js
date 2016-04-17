import React from "react";
import ReactDOM from "react-dom";
import updater from "../updater";

var Game = React.createClass({
  getInitialState(){
    return {
            updaterCloseSend: updater(this.renderIncrement, ""),
           };
  },

  renderIncrement(reply){
    if(reply){
      if(reply.active_game){
        this.props.setMainState({counter: reply});
      } else {
        this.props.setMainState({counter: reply, pageView: 3});
      }
      console.log(reply);
    }
  },

  quitGame(){
    this.props.setMainState({pageView: 1});
  },

  render(){
    return(
      <div className="center">
        <div className="container">
          <div className="container letter-box"></div>
          <input className="word-input" placeholder=" Type words using the letters above"/>
          <div className="vertical-spacer"></div>
          <div className="game-state">
          <div>Time remaining: {this.props.counter.main}</div>
          <div className="container word-results"></div>
          </div>
        </div>
        <button onClick={this.quitGame}>Quit</button>
      </div>
    );
  }
});

module.exports = Game;
