(function (Hydra) {
  'use strict';
  Hydra.addAsyncMapping( 'sl_', {}, function ( sDependency ) {
    var oResolution = this[sDependency],
    oPromise = new Hydra.Promise();
    if(!oResolution){
      return false;
    }
    var oConfig = {
      paths: {},
      shim: {}
    };
    oConfig.paths[sDependency] = oResolution.url.replace('.js', '');
    oConfig.shim[sDependency] = {};
    oConfig.shim[sDependency].exports = oResolution.exports;
    requirejs.config(oConfig);

    requirejs([sDependency], function ( oResolved ) {
      oPromise.resolve( oResolved );
    });
    return oPromise;
  } );
}(Hydra));