TwinkieSetApp.Models.Owner = Backbone.Model.extend({
  urlRoot: '/users/',

  initialize: function(options) {
  },

  parse: function (response) {
    if (response.albums) {
      this.albums().set(response.albums, { parse: true });
      delete response.albums;


      this.albums().forEach( function (album) {
        album._owner = this;
      }.bind(this));
    }

    return response;
  },

  // this.set(response)
  // var json = this.toJSON();

  albums: function () {
    if (!this._albums) {
      this._albums = new TwinkieSetApp.Collections.PublicAlbums([], {
        owner: this,
        userID: this.userID
      });
    }
    return this._albums;
  }

});