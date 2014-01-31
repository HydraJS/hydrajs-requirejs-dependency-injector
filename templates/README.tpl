# hydrajs-requirejs-dependency-injector

## Updated to version {{ version }}

[![Build Status](https://travis-ci.org/HydraJS/hydrajs-requirejs-dependency-injector.png)](https://travis-ci.org/HydraJS/hydrajs-requirejs-dependency-injector)

[Changelog](https://raw.github.com/HydraJS/hydrajs-requirejs-dependency-injector/master/changelog.txt)

## Description

Extension to add Hydra.js the possibility to resolve dependencies that need to be required using 'requirejs'.

[Project Web](http://tcorral.github.io/Hydra.js)

[Examples](http://tcorral.github.io/Hydra.js/#examples)

## Usage

### Install:

Install with [Bower](http://bower.io)

bower install hydrajs-requirejs-dependency-injector

Install with [Component](http://component.io)

component install hydrajs-requirejs-dependency-injector

Install with [NPM](http://npmjs.org)

npm install hydrajs-requirejs-dependency-injector

### Use in browser

Insert in your html code:

<script type="text/javascript" src="/path/to/your/js/libs/hydrajs-requirejs-dependency-injector.js"></script>

### Common usage
#### How to add my dependencies to the injector
	This extension adds a new dependency injector to have the objects/functions directly in the closure of modals when are created.

	Hydra.addMapping( 'sl_', {
		jQuery: {
			exports: 'jQuery',
			url: 'http://code.jquery.com/jquery-1.11.0.js'
		}
	});

	You only need to call the Hydra.addMapping method passing it the 'sl_' identifier and one object that should follow the next skeleton.

	{
		dependencyName: {
			exports: 'name_of_dependency',	// This could be the name of the AMD module or the object or function that is added to the global object.
			url: 'http://path.com/to/your/dependency.js'
		}
	}

#### How is used in Hydra modules.

	Hydra.module.register('my-module', ['sl_jQuery'], function ( $ ) {
		return {
			init: function () {
				// Use jQuery as usual
				$('#my_layer').css('display', 'none');
			}
		};
	});

## Documentation

[Project Web](http://tcorral.github.io/Hydra.js)

[Examples](http://tcorral.github.io/Hydra.js/#examples)

## License

Hydra.js and hydrajs-requirejs-dependency-injector are licensed under the MIT license.