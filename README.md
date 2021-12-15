# simple-comments-web

Clear, simple, focused design for long-form commenting and discussion.

## How to use

```vue
<template>
  <SimpleCommentsRoot APIURL="<your Simple Comments server URL>" />
</template>
<script>
    import { SimpleCommentsRoot } from 'simple-comments-web'
    export default {
        components: { SimpleCommentsRoot }
    }
</script>
```

## Screenshots

![Screenshot 1](https://piped-ng-assets.xn--17b.net/sca_web_1.png)

## Project setup
```
yarn install
```

### Compiles and hot-reloads for development
```
yarn serve
```

### Compiles and minifies for production
```
yarn build
```

### Lints and fixes files
```
yarn lint
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).

### License

Licensed under LGPLv3, see [COPYING](COPYING) and [COPYING.LESSER](COPYING.LESSER)
