# hydrajs-requirejs-dependency-injector

Bridge [Hydra.js](https://github.com/HydraJS/HydraJS) module dependencies to [RequireJS](https://requirejs.org/) so third-party scripts load asynchronously and are injected into Hydra module factories.

[![Build Status](https://travis-ci.org/HydraJS/hydrajs-requirejs-dependency-injector.png)](https://travis-ci.org/HydraJS/hydrajs-requirejs-dependency-injector)

## What it does

Hydra resolves named dependencies when you register modules. This package registers an **async** mapping on the `sl_` prefix: when a module asks for something like `sl_jQuery`, Hydra delegates to RequireJS, which loads the script (with optional shim `exports`), then passes the resolved value into your module callback.

The implementation is a small Hydra extension that calls `Hydra.addAsyncMapping('sl_', …)` and, for each dependency, configures RequireJS (`paths` + `shim`) and resolves a Hydra `Promise` when the AMD module is ready.

## Requirements

- **Hydra.js** (global `Hydra`)
- **RequireJS** (global `requirejs` / `require`)

Load both before this file.

## Install

```bash
npm install hydrajs-requirejs-dependency-injector
```

The package entry point is [`src/hydrajs-requirejs-dependency-injector.js`](./src/hydrajs-requirejs-dependency-injector.js). Serve it in the browser after Hydra and RequireJS (see below).

## Usage

### 1. Include scripts

Use paths that match your app layout:

```html
<script src="/path/to/require.js"></script>
<script src="/path/to/hydra.js"></script>
<script src="/path/to/node_modules/hydrajs-requirejs-dependency-injector/src/hydrajs-requirejs-dependency-injector.js"></script>
```

### 2. Register URL + export metadata

Call `Hydra.addMapping` with the `sl_` namespace and an object describing each dependency. Keys are the short names used after the `sl_` prefix in module definitions.

```javascript
Hydra.addMapping('sl_', {
  jQuery: {
    exports: 'jQuery',
    url: 'https://code.jquery.com/jquery-1.11.0.js'
  }
});
```

| Field      | Meaning |
| ---------- | ------- |
| `url`      | Script URL (the `.js` suffix is normalized when passed to RequireJS `paths`). |
| `exports`  | Global name or AMD module id that RequireJS should expose after load (shim `exports`). |

### 3. Use `sl_` dependencies in Hydra modules

Prefix the mapping key with `sl_` in the dependency array:

```javascript
Hydra.module.register('my-module', ['sl_jQuery'], function ($) {
  return {
    init: function () {
      $('#my_layer').css('display', 'none');
    }
  };
});
```

The factory receives the value resolved by RequireJS (for example the jQuery instance).

## Further reading

- [Hydra.js site & examples](http://tcorral.github.io/Hydra.js) (includes broader modular architecture)
- [Changelog](./changelog.txt)
- [Issues](https://github.com/HydraJS/hydrajs-requirejs-dependency-injector/issues)

## Development

```bash
npm install
npm test
```

Tests run via Karma (see `config/karma.conf.js`).

## License

MIT — see [LICENSE](./LICENSE).
