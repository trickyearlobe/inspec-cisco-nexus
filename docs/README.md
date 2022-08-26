# Documentation for inspec-cisco-nexus

The documentation for this resource pack is written with [VuePress](https://vuepress.vuejs.org).

To read it online in Github pages, just point your browser [HERE](https://trickyearlobe.github.io/inspec-cisco-nexus)

## Contributing

To work on the docs you will need node.js and the npm package manager installed.

Start a live reload development docs server and open your browser to http://localhost:8080

```bash
cd docs
npm run dev
```

Edit the docs as needed in `docs/src`

Build the docs once you ae happy with how they look.

```bash
npm run build
```

The compiled docs will end up in `docs/src/.vuepress/dist`

Publish the code using the normal PR process

```bash
git checkout -b docs-update-for-feature-x
git add .
git commit -sm "Add docs for feature X"
git push
```
